// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInEntityImpl _$$SignInEntityImplFromJson(Map<String, dynamic> json) =>
    _$SignInEntityImpl(
      accessToken: json['accessToken'] as String,
      authStatus: $enumDecode(_$AuthStatusTypeEnumMap, json['authStatus']),
    );

Map<String, dynamic> _$$SignInEntityImplToJson(_$SignInEntityImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'authStatus': _$AuthStatusTypeEnumMap[instance.authStatus]!,
    };

const _$AuthStatusTypeEnumMap = {
  AuthStatusType.sms: 'SMS',
  AuthStatusType.pvz: 'PVZ',
  AuthStatusType.done: 'DONE',
};
