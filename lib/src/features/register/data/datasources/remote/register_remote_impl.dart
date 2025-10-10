import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/register/domain/entities/register_pvz_entity.dart';
import 'package:my_point/src/features/register/domain/request/register_pvz_request.dart';

import '../../../../../../main.dart';
import '../../../../../core/api/client/endpoints.dart';
import '../../../../../core/api/client/rest/dio/dio_client.dart';
import '../../../../../core/exceptions/domain_exception.dart';
import '../../../../../core/services/storage/storage_service_impl.dart';
import 'i_register_remote.dart';

@named
@LazySingleton(as: IRegisterRemote)
class RegisterRemoteImpl implements IRegisterRemote {
  final client = DioRestClient();
  StorageServiceImpl st = StorageServiceImpl();
  Map<String, String> headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
  };
  @override
  Future<Either<DomainException, RegisterPvzEntity>> registerPvz(RegisterPvzRequest request) async {
    final Either<DomainException, Response<dynamic>> response = await client.post(
      '${EndPoints.baseUrl}${EndPoints.registerPvz}',
      data: request.toJson(),
      options: Options(
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
        },
      ),
    );
    return response.fold(
      (error) {
        log.d(request.toJson().toString());
        return Left(error);
      },
      (result) async {
        final data = result.data;
        if (data == null) {
          return Left(UnknownException(message: 'Response data is null'));
        }
        return Right(RegisterPvzEntity.fromJson(data));
      },
    );
  }
}
