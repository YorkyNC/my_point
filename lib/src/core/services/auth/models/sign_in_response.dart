import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';
import 'token_response.dart';

part 'sign_in_response.freezed.dart';
part 'sign_in_response.g.dart';

@freezed
class SignInResponse extends BaseEntity with _$SignInResponse {
  const factory SignInResponse({
    required String status,
    required Map<String, dynamic> meta,
    required TokenResponse data,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json);
}
