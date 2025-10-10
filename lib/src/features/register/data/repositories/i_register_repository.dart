import 'package:fpdart/fpdart.dart';
import 'package:my_point/src/features/register/domain/entities/register_pvz_entity.dart';
import 'package:my_point/src/features/register/domain/request/register_pvz_request.dart';

import '../../../../core/exceptions/domain_exception.dart';

abstract class IRegisterRepository {
  Future<Either<DomainException, RegisterPvzEntity>> registerPvz(
    RegisterPvzRequest body,
  );
}
