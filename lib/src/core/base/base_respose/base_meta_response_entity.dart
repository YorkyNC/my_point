import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_meta_response_entity.freezed.dart';
part 'base_meta_response_entity.g.dart';

@freezed
class BaseMetaResponseEntity with _$BaseMetaResponseEntity {
  const factory BaseMetaResponseEntity({
    String? endCursor,
    required bool hasNextPage,
  }) = _BaseMetaResponseEntity;

  factory BaseMetaResponseEntity.fromJson(Map<String, dynamic> json) => _$BaseMetaResponseEntityFromJson(json);
}
