import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/scan/domain/entities/barcode_scan_entity.dart' show BarcodeScanEntity;
import 'package:my_point/src/features/scan/domain/repositories/scan_repository_impl.dart';
import 'package:my_point/src/features/scan/domain/request/barcode_scan_request.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/i_scan_repository.dart';

@lazySingleton
class BarcodeScanUseCase extends UseCase<BarcodeScanEntity, BarcodeScanRequest> {
  final IScanRepository _scanRepository;

  BarcodeScanUseCase(@Named.from(ScanRepositoryImpl) this._scanRepository);

  @override
  Future<Either<DomainException, BarcodeScanEntity>> execute(BarcodeScanRequest requestModel) async =>
      _scanRepository.barcodeScan(requestModel);
}
