import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/scan/data/datasources/remote/i_scan_remote.dart';
import 'package:my_point/src/features/scan/data/datasources/remote/scan_remote_impl.dart';
import 'package:my_point/src/features/scan/domain/entities/barcode_scan_entity.dart';
import 'package:my_point/src/features/scan/domain/entities/qr_scan_entity.dart';
import 'package:my_point/src/features/scan/domain/request/barcode_scan_request.dart';
import 'package:my_point/src/features/scan/domain/request/qr_scan_request.dart';

import '../../../../../main.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/i_scan_repository.dart';

@named
@LazySingleton(as: IScanRepository)
class ScanRepositoryImpl implements IScanRepository {
  final IScanRemote _scanRemote;

  ScanRepositoryImpl(@Named.from(ScanRemoteImpl) this._scanRemote);

  @override
  Future<Either<DomainException, BarcodeScanEntity>> barcodeScan(BarcodeScanRequest body) async {
    try {
      final requests = await _scanRemote.barcodeScan(body);
      return requests.fold(
        (error) {
          return Left(error);
        },
        (response) => Right(response),
      );
    } catch (e) {
      log.e(e.toString());
      return Left(UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, QrScanEntity>> qrScan(QrScanRequest body) async {
    try {
      final requests = await _scanRemote.qrScan(body);
      return requests.fold(
        (error) {
          return Left(error);
        },
        (response) => Right(response),
      );
    } catch (e) {
      log.e(e.toString());
      return Left(UnknownException(message: e.toString()));
    }
  }
}
