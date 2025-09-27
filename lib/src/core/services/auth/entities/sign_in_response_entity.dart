import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../src/core/base/base_models/base_entity.dart';

part 'sign_in_response_entity.freezed.dart';
part 'sign_in_response_entity.g.dart';

@freezed
class SignInResponseEntity extends BaseEntity with _$SignInResponseEntity {
  const factory SignInResponseEntity({
    required String phone,
  }) = _SignInResponseEntity;

  factory SignInResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseEntityFromJson(json);
}
