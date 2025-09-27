import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../../../core/services/auth/models/refresh_token_response.dart';
import '../../data/repositories/i_auth_repository.dart';
import '../repositories/auth_repository_impl.dart';

@lazySingleton
class RefreshTokenUseCase
    extends NoneInputBoundaryUseCase<RefreshTokenResponse> {
  final IAuthRepository _authRepository;

  RefreshTokenUseCase(@Named.from(AuthRepositoryImpl) this._authRepository);

  @override
  Future<Either<DomainException, RefreshTokenResponse>> execute() async =>
      _authRepository.refreshToken();
}
