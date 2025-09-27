import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';
import '../../../base/base_respose/base_response_no_meta_entity.dart';

part 'forgot_password_response.freezed.dart';
part 'forgot_password_response.g.dart';

@freezed
class ForgotPasswordResponse extends BaseEntity with _$ForgotPasswordResponse {
  const factory ForgotPasswordResponse({
    required int passwordResetId,
  }) = _ForgotPasswordResponse;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResponseFromJson(json);
}

typedef ForgotPasswordResponses = BaseResponseNoMetaEntity<ForgotPasswordResponse>;
