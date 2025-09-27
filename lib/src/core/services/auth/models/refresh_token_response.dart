import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';
import 'token_response.dart';

part 'refresh_token_response.freezed.dart';
part 'refresh_token_response.g.dart';

@freezed
class RefreshTokenResponse extends BaseEntity with _$RefreshTokenResponse {
  const RefreshTokenResponse._(); // Add private constructor for extends

  const factory RefreshTokenResponse({
    required String status,
    required Map<String, dynamic> meta,
    required TokenResponse data,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseFromJson(json);
}
