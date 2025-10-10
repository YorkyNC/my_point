import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/scan/domain/entities/barcode_scan_entity.dart';
import 'package:my_point/src/features/scan/domain/entities/qr_scan_entity.dart';
import 'package:my_point/src/features/scan/domain/request/barcode_scan_request.dart';
import 'package:my_point/src/features/scan/domain/request/qr_scan_request.dart';

import '../../../../../../main.dart';
import '../../../../../core/api/client/endpoints.dart';
import '../../../../../core/api/client/rest/dio/dio_client.dart';
import '../../../../../core/exceptions/domain_exception.dart';
import '../../../../../core/services/storage/storage_service_impl.dart';
import 'i_scan_remote.dart';

@named
@LazySingleton(as: IScanRemote)
class ScanRemoteImpl implements IScanRemote {
  final client = DioRestClient();
  StorageServiceImpl st = StorageServiceImpl();
  Map<String, String> headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
  };
  @override
  Future<Either<DomainException, BarcodeScanEntity>> barcodeScan(BarcodeScanRequest request) async {
    final Either<DomainException, Response<dynamic>> response = await client.post(
      '${EndPoints.baseUrl}${EndPoints.barcodeScan}',
      data: request,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
        },
      ),
    );
    return response.fold(
      (error) {
        log.d(request.barcode.toString());
        return Left(error);
      },
      (result) async {
        return Right(BarcodeScanEntity.fromJson(result.data));
      },
    );
  }

  @override
  Future<Either<DomainException, QrScanEntity>> qrScan(QrScanRequest request) async {
    final Either<DomainException, Response<dynamic>> response = await client.post(
      '${EndPoints.baseUrl}${EndPoints.qrScan}',
      data: request,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
        },
      ),
    );
    return response.fold(
      (error) {
        log.d(request.encodedData.toString());
        return Left(error);
      },
      (result) async {
        return Right(QrScanEntity.fromJson(result.data));
      },
    );
  }
}
