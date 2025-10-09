import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_request.dart';

part 'verify_otp_request.freezed.dart';
part 'verify_otp_request.g.dart';

@freezed
class VerifyOtpRequest extends BaseRequest with _$VerifyOtpRequest {
  const factory VerifyOtpRequest({
    required String pin,
    required String pinId,
  }) = _VerifyOtpRequest;

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) => _$VerifyOtpRequestFromJson(json);
}
