// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_meta_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseMetaResponseEntityImpl _$$BaseMetaResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$BaseMetaResponseEntityImpl(
      endCursor: json['endCursor'] as String?,
      hasNextPage: json['hasNextPage'] as bool,
    );

Map<String, dynamic> _$$BaseMetaResponseEntityImplToJson(
        _$BaseMetaResponseEntityImpl instance) =>
    <String, dynamic>{
      if (instance.endCursor case final value?) 'endCursor': value,
      'hasNextPage': instance.hasNextPage,
    };
