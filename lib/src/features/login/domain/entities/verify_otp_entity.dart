import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'verify_otp_entity.freezed.dart';
part 'verify_otp_entity.g.dart';

@freezed
class VerifyOtpEntity extends BaseEntity with _$VerifyOtpEntity {
  const factory VerifyOtpEntity({
    required String pinId,
    required String msisdn,
    required bool verified,
    required int attemptsRemaining,
    String? pinError,
  }) = _VerifyOtpEntity;

  factory VerifyOtpEntity.fromJson(Map<String, dynamic> json) => _$VerifyOtpEntityFromJson(json);
}
