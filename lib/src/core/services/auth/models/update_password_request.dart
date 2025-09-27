import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_request.dart';

part 'update_password_request.freezed.dart';
part 'update_password_request.g.dart';

@freezed
class UpdatePasswordRequest extends BaseRequest with _$UpdatePasswordRequest {
  const factory UpdatePasswordRequest({
    required String password,
    required String confirmPassword,
  }) = _UpdatePasswordRequest;

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) => _$UpdatePasswordRequestFromJson(json);
}
