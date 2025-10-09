// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyOtpEntityImpl _$$VerifyOtpEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpEntityImpl(
      pinId: json['pinId'] as String,
      msisdn: json['msisdn'] as String,
      verified: json['verified'] as bool,
      attemptsRemaining: (json['attemptsRemaining'] as num).toInt(),
      pinError: json['pinError'] as String?,
    );

Map<String, dynamic> _$$VerifyOtpEntityImplToJson(
        _$VerifyOtpEntityImpl instance) =>
    <String, dynamic>{
      'pinId': instance.pinId,
      'msisdn': instance.msisdn,
      'verified': instance.verified,
      'attemptsRemaining': instance.attemptsRemaining,
      if (instance.pinError case final value?) 'pinError': value,
    };
