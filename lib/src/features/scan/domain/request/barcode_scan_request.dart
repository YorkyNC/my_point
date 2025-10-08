import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_request.dart';

part 'barcode_scan_request.freezed.dart';
part 'barcode_scan_request.g.dart';

@freezed
class BarcodeScanRequest extends BaseRequest with _$BarcodeScanRequest {
  const factory BarcodeScanRequest({
    required String barcode,
    required String pvzId,
  }) = _BarcodeScanRequest;

  factory BarcodeScanRequest.fromJson(Map<String, dynamic> json) => _$BarcodeScanRequestFromJson(json);
}
