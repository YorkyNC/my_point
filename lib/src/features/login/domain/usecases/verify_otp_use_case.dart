import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/login/domain/entities/verify_otp_entity.dart';
import 'package:my_point/src/features/login/domain/repositories/authorization_repository_impl.dart'
    show AuthorizationRepositoryImpl;
import 'package:my_point/src/features/login/domain/request/verify_otp_request.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/i_auth_repository.dart';

@lazySingleton
class VerifyOtpUseCase extends UseCase<VerifyOtpEntity, VerifyOtpRequest> {
  final IAuthRepository _authRepository;

  VerifyOtpUseCase(@Named.from(AuthorizationRepositoryImpl) this._authRepository);

  @override
  Future<Either<DomainException, VerifyOtpEntity>> execute(VerifyOtpRequest requestModel) async =>
      _authRepository.verifyOtp(requestModel);
}
