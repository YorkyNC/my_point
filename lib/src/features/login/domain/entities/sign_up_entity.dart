import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_point/src/features/login/domain/enum/auth_status_type.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'sign_up_entity.freezed.dart';
part 'sign_up_entity.g.dart';

@freezed
class SignUpEntity extends BaseEntity with _$SignUpEntity {
  const factory SignUpEntity({
    required String accessToken,
    required AuthStatusType authStatus,
  }) = _SignUpEntity;

  factory SignUpEntity.fromJson(Map<String, dynamic> json) => _$SignUpEntityFromJson(json);
}
