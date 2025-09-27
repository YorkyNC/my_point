import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_entity.freezed.dart';
part 'base_response_entity.g.dart';

@Freezed(genericArgumentFactories: true)
@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseResponseEntity<T, M> with _$BaseResponseEntity<T, M> {
  const factory BaseResponseEntity({
    required T data,
    required String status,
    required M meta,
  }) = _BaseResponseEntity;
  factory BaseResponseEntity.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
    M Function(Object?) fromJsonM,
  ) {
    return _$BaseResponseEntityFromJson(json, fromJsonT, fromJsonM);
  }
}
