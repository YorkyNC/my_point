import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_request.dart';

part 'qr_scan_request.freezed.dart';
part 'qr_scan_request.g.dart';

@freezed
class QrScanRequest extends BaseRequest with _$QrScanRequest {
  const factory QrScanRequest({
    @JsonKey(name: 'encoded_data') required String encodedData, //base64 encoded data
    @JsonKey(name: 'current_pvz_id') required String currentPvzId,
  }) = _QrScanRequest;

  factory QrScanRequest.fromJson(Map<String, dynamic> json) => _$QrScanRequestFromJson(json);
}
