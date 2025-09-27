// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AirportImpl _$$AirportImplFromJson(Map<String, dynamic> json) =>
    _$AirportImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$AirportImplToJson(_$AirportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'city': instance.city,
      'country': instance.country,
    };
