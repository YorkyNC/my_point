// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      userId: (json['userId'] as num).toInt(),
      surname: json['surname'] as String,
      imageUrl: json['imageUrl'] as String?,
      patronym: json['patronym'] as String?,
      name: json['name'] as String,
      isActivated: json['isActivated'] as bool,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'surname': instance.surname,
      if (instance.imageUrl case final value?) 'imageUrl': value,
      if (instance.patronym case final value?) 'patronym': value,
      'name': instance.name,
      'isActivated': instance.isActivated,
    };
