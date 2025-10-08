import 'package:fpdart/fpdart.dart';
import 'package:my_point/src/core/exceptions/domain_exception.dart' show DomainException;
import 'package:my_point/src/features/scan/domain/entities/barcode_scan_entity.dart';
import 'package:my_point/src/features/scan/domain/entities/qr_scan_entity.dart';
import 'package:my_point/src/features/scan/domain/request/barcode_scan_request.dart';
import 'package:my_point/src/features/scan/domain/request/qr_scan_request.dart';

abstract class IScanRemote {
  Future<Either<DomainException, BarcodeScanEntity>> barcodeScan(
    BarcodeScanRequest request,
  );
  Future<Either<DomainException, QrScanEntity>> qrScan(
    QrScanRequest request,
  );
}
