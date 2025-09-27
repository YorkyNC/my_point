import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../src/core/base/base_models/base_entity.dart';

part 'sign_in_request_entity.freezed.dart';
part 'sign_in_request_entity.g.dart';

@freezed
class SignInRequestEntity extends BaseEntity with _$SignInRequestEntity {
  const factory SignInRequestEntity({
    required String phone,
  }) = _SignInRequestEntity;

  factory SignInRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestEntityFromJson(json);
}
