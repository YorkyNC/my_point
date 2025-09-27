import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'update_password_response.freezed.dart';
part 'update_password_response.g.dart';

@freezed
class UpdatePasswordResponse extends BaseEntity with _$UpdatePasswordResponse {
  const factory UpdatePasswordResponse({
    String? message,
  }) = _UpdatePasswordResponse;

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordResponseFromJson(json);
}
