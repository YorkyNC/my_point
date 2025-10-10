import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/register/domain/entities/register_pvz_entity.dart';
import 'package:my_point/src/features/register/domain/repositories/register_repository_impl.dart';
import 'package:my_point/src/features/register/domain/request/register_pvz_request.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/i_register_repository.dart';

@lazySingleton
class RegisterPvzUseCase extends UseCase<RegisterPvzEntity, RegisterPvzRequest> {
  final IRegisterRepository _registerRepository;

  RegisterPvzUseCase(@Named.from(RegisterRepositoryImpl) this._registerRepository);

  @override
  Future<Either<DomainException, RegisterPvzEntity>> execute(RegisterPvzRequest requestModel) async =>
      _registerRepository.registerPvz(requestModel);
}
