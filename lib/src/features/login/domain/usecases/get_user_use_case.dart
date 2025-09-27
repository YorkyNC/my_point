import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/auth/entities/user_entity.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/i_auth_repository.dart';
import '../repositories/auth_repository_impl.dart';

@lazySingleton
class GetUserUseCase extends NoneInputBoundaryUseCase<UserEntity> {
  final IAuthRepository _authRepository;

  GetUserUseCase(@Named.from(AuthRepositoryImpl) this._authRepository);

  @override
  Future<Either<DomainException, UserEntity>> execute() async => _authRepository.getUser();
}
