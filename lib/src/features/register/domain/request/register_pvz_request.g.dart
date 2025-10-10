// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_pvz_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterPvzRequestImpl _$$RegisterPvzRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterPvzRequestImpl(
      address: json['address'] as String,
      city: json['city'] as String,
      files: (json['files'] as List<dynamic>).map((e) => e as String).toList(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      name: json['name'] as String,
      square: json['square'] as String,
    );

Map<String, dynamic> _$$RegisterPvzRequestImplToJson(
        _$RegisterPvzRequestImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'files': instance.files,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'square': instance.square,
    };
