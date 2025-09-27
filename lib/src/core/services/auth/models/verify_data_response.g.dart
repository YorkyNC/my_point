// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyDataResponseImpl _$$VerifyDataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyDataResponseImpl(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
    );

Map<String, dynamic> _$$VerifyDataResponseImplToJson(
        _$VerifyDataResponseImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
    };
