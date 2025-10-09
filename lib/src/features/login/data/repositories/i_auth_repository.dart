import 'package:fpdart/fpdart.dart';
import 'package:my_point/src/features/login/domain/entities/request_otp_code_entity.dart';
import 'package:my_point/src/features/login/domain/entities/sign_in_entity.dart';
import 'package:my_point/src/features/login/domain/entities/sign_up_entity.dart';
import 'package:my_point/src/features/login/domain/entities/verify_otp_entity.dart';
import 'package:my_point/src/features/login/domain/request/request_otp_code.dart';
import 'package:my_point/src/features/login/domain/request/sign_in_request.dart';
import 'package:my_point/src/features/login/domain/request/sign_up_request.dart';
import 'package:my_point/src/features/login/domain/request/verify_otp_request.dart';

import '../../../../core/exceptions/domain_exception.dart';

abstract class IAuthRepository {
  Future<Either<DomainException, SignInEntity>> signIn(
    SignInRequest body,
  );
  Future<Either<DomainException, SignUpEntity>> signUp(
    SignUpRequest body,
  );
  Future<Either<DomainException, RequestOtpCodeEntity>> requestOtpCode(
    RequestOtpCode body,
  );
  Future<Either<DomainException, VerifyOtpEntity>> verifyOtp(
    VerifyOtpRequest body,
  );
}
