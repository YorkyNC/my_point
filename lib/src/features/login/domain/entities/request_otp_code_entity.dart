import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'request_otp_code_entity.freezed.dart';
part 'request_otp_code_entity.g.dart';

@freezed
class RequestOtpCodeEntity extends BaseEntity with _$RequestOtpCodeEntity {
  const factory RequestOtpCodeEntity({
    required String pinId,
    required String to,
    required String ncStatus,
    required String smsStatus,
  }) = _RequestOtpCodeEntity;

  factory RequestOtpCodeEntity.fromJson(Map<String, dynamic> json) => _$RequestOtpCodeEntityFromJson(json);
}
