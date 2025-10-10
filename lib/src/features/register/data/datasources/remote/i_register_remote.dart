import 'package:fpdart/fpdart.dart';
import 'package:my_point/src/core/exceptions/domain_exception.dart' show DomainException;
import 'package:my_point/src/features/register/domain/entities/register_pvz_entity.dart';
import 'package:my_point/src/features/register/domain/request/register_pvz_request.dart';

abstract class IRegisterRemote {
  Future<Either<DomainException, RegisterPvzEntity>> registerPvz(
    RegisterPvzRequest request,
  );
}
