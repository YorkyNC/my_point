// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpEntityImpl _$$SignUpEntityImplFromJson(Map<String, dynamic> json) =>
    _$SignUpEntityImpl(
      accessToken: json['accessToken'] as String,
      authStatus: $enumDecode(_$AuthStatusTypeEnumMap, json['authStatus']),
    );

Map<String, dynamic> _$$SignUpEntityImplToJson(_$SignUpEntityImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'authStatus': _$AuthStatusTypeEnumMap[instance.authStatus]!,
    };

const _$AuthStatusTypeEnumMap = {
  AuthStatusType.sms: 'SMS',
  AuthStatusType.pvz: 'PVZ',
  AuthStatusType.done: 'DONE',
};
