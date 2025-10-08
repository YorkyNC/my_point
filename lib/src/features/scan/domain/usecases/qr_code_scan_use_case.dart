import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/scan/domain/entities/qr_scan_entity.dart';
import 'package:my_point/src/features/scan/domain/repositories/scan_repository_impl.dart';
import 'package:my_point/src/features/scan/domain/request/qr_scan_request.dart' show QrScanRequest;

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/i_scan_repository.dart';

@lazySingleton
class QrCodeScanUseCase extends UseCase<QrScanEntity, QrScanRequest> {
  final IScanRepository _scanRepository;

  QrCodeScanUseCase(@Named.from(ScanRepositoryImpl) this._scanRepository);

  @override
  Future<Either<DomainException, QrScanEntity>> execute(QrScanRequest requestModel) async =>
      _scanRepository.qrScan(requestModel);
}
