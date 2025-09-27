import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'resend_code_response.freezed.dart';
part 'resend_code_response.g.dart';

@freezed
class ResendCodeResponse extends BaseEntity with _$ResendCodeResponse {
  const factory ResendCodeResponse({
    required String status,
  }) = _ResendCodeResponse;

  factory ResendCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendCodeResponseFromJson(json);
}
