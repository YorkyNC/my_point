// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_otp_code_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestOtpCodeEntityImpl _$$RequestOtpCodeEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestOtpCodeEntityImpl(
      pinId: json['pinId'] as String,
      to: json['to'] as String,
      ncStatus: json['ncStatus'] as String,
      smsStatus: json['smsStatus'] as String,
    );

Map<String, dynamic> _$$RequestOtpCodeEntityImplToJson(
        _$RequestOtpCodeEntityImpl instance) =>
    <String, dynamic>{
      'pinId': instance.pinId,
      'to': instance.to,
      'ncStatus': instance.ncStatus,
      'smsStatus': instance.smsStatus,
    };
