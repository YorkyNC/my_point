// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_no_meta_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseNoMetaEntity<T> _$BaseResponseNoMetaEntityFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponseNoMetaEntity<T>(
      data: fromJsonT(json['data']),
      status: json['status'] as String,
    );
