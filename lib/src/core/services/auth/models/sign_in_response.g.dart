// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInResponseImpl _$$SignInResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignInResponseImpl(
      status: json['status'] as String,
      meta: json['meta'] as Map<String, dynamic>,
      data: TokenResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignInResponseImplToJson(
        _$SignInResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'meta': instance.meta,
      'data': instance.data,
    };
