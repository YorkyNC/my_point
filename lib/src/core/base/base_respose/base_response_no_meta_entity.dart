import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_no_meta_entity.freezed.dart';
part 'base_response_no_meta_entity.g.dart';

@Freezed(genericArgumentFactories: true)
@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseResponseNoMetaEntity<T> with _$BaseResponseNoMetaEntity<T> {
  const factory BaseResponseNoMetaEntity({
    required T data,
    required String status,
  }) = _BaseResponseNoMetaEntity;

  factory BaseResponseNoMetaEntity.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return _$BaseResponseNoMetaEntityFromJson(json, fromJsonT);
  }
}
