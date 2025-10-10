import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';
import 'package:my_point/src/core/exceptions/failure.dart';
import 'package:my_point/src/features/register/domain/entities/register_pvz_entity.dart';
import 'package:my_point/src/features/register/domain/request/register_pvz_request.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../main.dart';
import '../../../../../core/api/client/endpoints.dart';
import '../../../../../core/api/client/rest/dio/dio_client.dart';
import '../../../../../core/exceptions/domain_exception.dart';
import '../../../../../core/services/storage/storage_service_impl.dart';
import 'i_register_remote.dart';

@named
@LazySingleton(as: IRegisterRemote)
class RegisterRemoteImpl implements IRegisterRemote {
  RegisterRemoteImpl(this.client);

  final DioRestClient client;
  Future<File?> _compressImage(String filePath, int index) async {
    try {
      final file = File(filePath);
      final fileSizeInBytes = await file.length();
      final fileSizeInMB = fileSizeInBytes / (1024 * 1024);

      log.d('Original file $index size: ${fileSizeInMB.toStringAsFixed(2)} MB');

      if (fileSizeInMB < 0.8) {
        log.d('File $index is small enough, skipping compression');
        return file;
      }

      final imageBytes = await file.readAsBytes();
      final image = img.decodeImage(imageBytes);

      if (image == null) {
        log.d('Failed to decode image $index, using original');
        return file;
      }

      img.Image resized = image;
      if (image.width > 1024 || image.height > 1024) {
        resized = img.copyResize(
          image,
          width: image.width > image.height ? 1024 : null,
          height: image.height > image.width ? 1024 : null,
        );
        log.d('Resized from ${image.width}x${image.height} to ${resized.width}x${resized.height}');
      }

      final compressedBytes = img.encodeJpg(resized, quality: 75);

      final dir = await getTemporaryDirectory();
      final targetPath = '${dir.path}/compressed_image_$index.jpg';
      final compressedFile = File(targetPath);
      await compressedFile.writeAsBytes(compressedBytes);

      final compressedSize = compressedBytes.length;
      final compressedSizeInMB = compressedSize / (1024 * 1024);
      log.d('Compressed file $index size: ${compressedSizeInMB.toStringAsFixed(2)} MB');

      return compressedFile;
    } catch (e, stackTrace) {
      log.d('Compression failed for file $index: $e');
      log.d('Stack trace: $stackTrace');
      return File(filePath);
    }
  }

  @override
  Future<Either<DomainException, RegisterPvzEntity>> registerPvz(RegisterPvzRequest request) async {
    final List<String> fileIds = [];

    for (int i = 0; i < request.files.length; i++) {
      try {
        final compressedFile = await _compressImage(request.files[i], i);
        if (compressedFile == null) {
          continue;
        }

        final multipartFile = await MultipartFile.fromFile(
          compressedFile.path,
          filename: 'image_$i.png',
        );

        final fileFormData = FormData.fromMap({
          'file': multipartFile,
        });

        final token = StorageServiceImpl().getToken();
        log.d('📤 File upload ${i + 1} - Auth header: Bearer ${token?.substring(0, 30)}...');

        final fileUploadResponse = await client.post(
          '${EndPoints.baseUrl}/file',
          data: fileFormData,
          options: Options(
            headers: {
              'accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
        );

        final uploadResult = fileUploadResponse.fold(
          (error) {
            if (error is ServerException) {
              log.d('Server error - Status code: ${error.message}');
            }
            return null;
          },
          (response) {
            if (response.data is Map<String, dynamic>) {
              final fileId = response.data['fileId'] as String?;
              return fileId;
            } else {
              return null;
            }
          },
        );

        if (uploadResult != null) {
          fileIds.add(uploadResult);
        } else {}
      } catch (e) {
        log.d('Exception during file ${i + 1} upload: $e');
      }
    }

    log.d('Total fileIds collected: ${fileIds.length}');

    final registerData = {
      'address': request.address,
      'city': request.city,
      'files': [],
      'latitude': request.latitude,
      'longitude': request.longitude,
      'name': request.name,
      'square': request.square,
    };

    final token = StorageServiceImpl().getToken();

    final Either<DomainException, Response<dynamic>> response = await client.post(
      '${EndPoints.baseUrl}${EndPoints.registerPvz}',
      data: registerData,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.fold(
      (error) {
        log.d('PVZ registration error: ${error.message}');
        return Left(error);
      },
      (result) async {
        final data = result.data;
        log.d('PVZ registration success. Response: $data');
        log.d('Response type: ${data.runtimeType}');
        log.d('Response headers: ${result.headers}');

        if (data == null) {
          return Left(UnknownException(message: 'Response data is null'));
        }

        try {
          if (data is String) {
            log.d('✅ PVZ registered successfully. Server message: $data');
            return Right(RegisterPvzEntity(message: data));
          }

          return Right(RegisterPvzEntity.fromJson(data as Map<String, dynamic>));
        } catch (e) {
          log.d('Error parsing response: $e');
          log.d('Raw response data: $data');
          return Left(UnknownException(message: 'Failed to parse response: $e'));
        }
      },
    );
  }
}
