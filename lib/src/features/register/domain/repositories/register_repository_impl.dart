import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/register/data/datasources/remote/i_register_remote.dart';
import 'package:my_point/src/features/register/data/datasources/remote/register_remote_impl.dart';
import 'package:my_point/src/features/register/domain/entities/register_pvz_entity.dart';
import 'package:my_point/src/features/register/domain/request/register_pvz_request.dart';

import '../../../../../main.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/i_register_repository.dart';

@named
@LazySingleton(as: IRegisterRepository)
class RegisterRepositoryImpl implements IRegisterRepository {
  final IRegisterRemote _registerRemote;

  RegisterRepositoryImpl(@Named.from(RegisterRemoteImpl) this._registerRemote);

  @override
  Future<Either<DomainException, RegisterPvzEntity>> registerPvz(RegisterPvzRequest body) async {
    try {
      final requests = await _registerRemote.registerPvz(body);
      return requests.fold(
        (error) {
          return Left(error);
        },
        (response) => Right(response),
      );
    } catch (e) {
      log.e(e.toString());
      return Left(UnknownException(message: e.toString()));
    }
  }
}
