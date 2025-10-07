import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/login/domain/entities/request_otp_code_entity.dart' show RequestOtpCodeEntity;
import 'package:my_point/src/features/login/domain/repositories/authorization_repository_impl.dart'
    show AuthorizationRepositoryImpl;
import 'package:my_point/src/features/login/domain/request/request_otp_code.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/i_auth_repository.dart';

@lazySingleton
class RequestOtpCodeUseCase extends UseCase<RequestOtpCodeEntity, RequestOtpCode> {
  final IAuthRepository _authRepository;

  RequestOtpCodeUseCase(@Named.from(AuthorizationRepositoryImpl) this._authRepository);

  @override
  Future<Either<DomainException, RequestOtpCodeEntity>> execute(RequestOtpCode requestModel) async =>
      _authRepository.requestOtpCode(requestModel);
}
