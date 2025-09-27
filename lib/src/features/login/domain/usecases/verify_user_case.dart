import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../../../core/services/auth/models/models.dart';
import '../../data/repositories/i_auth_repository.dart';
import '../repositories/auth_repository_impl.dart';

@lazySingleton
class VerifyUseCase extends UseCase<VerifyResponse, VerifyRequest> {
  final IAuthRepository _authRepository;

  VerifyUseCase(@Named.from(AuthRepositoryImpl) this._authRepository);

  @override
  Future<Either<DomainException, VerifyResponse>> execute(
          VerifyRequest requestModel) async =>
      _authRepository.verifyUser(requestModel);
}
