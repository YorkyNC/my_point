import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/login/domain/entities/sign_in_entity.dart';
import 'package:my_point/src/features/login/domain/repositories/authorization_repository_impl.dart'
    show AuthorizationRepositoryImpl;
import 'package:my_point/src/features/login/domain/request/sign_in_request.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/i_auth_repository.dart';

@lazySingleton
class SignInUseCase extends UseCase<SignInEntity, SignInRequest> {
  final IAuthRepository _authRepository;

  SignInUseCase(@Named.from(AuthorizationRepositoryImpl) this._authRepository);

  @override
  Future<Either<DomainException, SignInEntity>> execute(SignInRequest requestModel) async =>
      _authRepository.signIn(requestModel);
}
