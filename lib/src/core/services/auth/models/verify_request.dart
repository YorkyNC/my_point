import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_request.dart';

part 'verify_request.freezed.dart';
part 'verify_request.g.dart';

@freezed
class VerifyRequest extends BaseRequest with _$VerifyRequest {
  const factory VerifyRequest({
    String? code,
    String? password,
    String? confirmPassword,
  }) = _VerifyRequest;

  factory VerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyRequestFromJson(json);
}
