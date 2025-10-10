import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'register_pvz_entity.freezed.dart';
part 'register_pvz_entity.g.dart';

@freezed
class RegisterPvzEntity extends BaseEntity with _$RegisterPvzEntity {
  const factory RegisterPvzEntity({
    String? message,
  }) = _RegisterPvzEntity;

  factory RegisterPvzEntity.fromJson(Map<String, dynamic> json) => _$RegisterPvzEntityFromJson(json);
}
