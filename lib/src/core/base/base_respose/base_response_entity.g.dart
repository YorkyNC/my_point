// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseEntity<T, M> _$BaseResponseEntityFromJson<T, M>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
  M Function(Object? json) fromJsonM,
) =>
    BaseResponseEntity<T, M>(
      data: fromJsonT(json['data']),
      status: json['status'] as String,
      meta: fromJsonM(json['meta']),
    );
