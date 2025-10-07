import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_request.dart';

part 'request_otp_code.freezed.dart';
part 'request_otp_code.g.dart';

@freezed
class RequestOtpCode extends BaseRequest with _$RequestOtpCode {
  const factory RequestOtpCode({
    required String phoneNumber,
  }) = _RequestOtpCode;

  factory RequestOtpCode.fromJson(Map<String, dynamic> json) => _$RequestOtpCodeFromJson(json);
}
