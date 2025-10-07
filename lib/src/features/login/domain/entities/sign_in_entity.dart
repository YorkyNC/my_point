import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_point/src/features/login/domain/enum/auth_status_type.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'sign_in_entity.freezed.dart';
part 'sign_in_entity.g.dart';

@freezed
class SignInEntity extends BaseEntity with _$SignInEntity {
  const factory SignInEntity({
    required String accessToken,
    required AuthStatusType authStatus,
  }) = _SignInEntity;

  factory SignInEntity.fromJson(Map<String, dynamic> json) => _$SignInEntityFromJson(json);
}
