import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/auth/models/sign_in_response.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../../../core/services/auth/models/models.dart';
import '../../data/repositories/i_auth_repository.dart';
import '../repositories/auth_repository_impl.dart';

@lazySingleton
class LoginUseCase extends UseCase<SignInResponse, SignInRequest> {
  final IAuthRepository _authRepository;

  LoginUseCase(@Named.from(AuthRepositoryImpl) this._authRepository);

  @override
  Future<Either<DomainException, SignInResponse>> execute(SignInRequest requestModel) async =>
      _authRepository.loginUser(requestModel);
}
