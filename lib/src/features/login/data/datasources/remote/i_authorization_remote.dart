import 'package:fpdart/fpdart.dart';
import 'package:my_point/src/core/exceptions/domain_exception.dart' show DomainException;
import 'package:my_point/src/features/login/domain/entities/sign_in_entity.dart' show SignInEntity;
import 'package:my_point/src/features/login/domain/entities/sign_up_entity.dart';
import 'package:my_point/src/features/login/domain/request/sign_in_request.dart';
import 'package:my_point/src/features/login/domain/request/sign_up_request.dart';

abstract class IAuthorizationRemote {
  Future<Either<DomainException, SignInEntity>> signIn(
    SignInRequest request,
  );
  Future<Either<DomainException, SignUpEntity>> signUp(
    SignUpRequest request,
  );
}
