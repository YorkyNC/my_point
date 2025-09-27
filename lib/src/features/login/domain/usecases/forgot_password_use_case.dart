import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/auth/models/forgot_password_response.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../../../core/services/auth/models/models.dart';
import '../../data/repositories/i_auth_repository.dart';
import '../repositories/auth_repository_impl.dart';

@lazySingleton
class ForgotPasswordUseCase extends UseCase<ForgotPasswordResponses, ForgotPasswordRequest> {
  final IAuthRepository _authRepository;

  ForgotPasswordUseCase(@Named.from(AuthRepositoryImpl) this._authRepository);

  @override
  Future<Either<DomainException, ForgotPasswordResponses>> execute(requestModel) async =>
      _authRepository.forgotPassword(requestModel);
}
