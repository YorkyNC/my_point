// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyRequestImpl _$$VerifyRequestImplFromJson(Map<String, dynamic> json) =>
    _$VerifyRequestImpl(
      code: json['code'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$$VerifyRequestImplToJson(_$VerifyRequestImpl instance) =>
    <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.password case final value?) 'password': value,
      if (instance.confirmPassword case final value?) 'confirmPassword': value,
    };
