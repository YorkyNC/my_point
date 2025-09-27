import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'verify_data_response.freezed.dart';
part 'verify_data_response.g.dart';

@freezed
class VerifyDataResponse extends BaseEntity with _$VerifyDataResponse {
  const factory VerifyDataResponse({
    required String accessToken,
    required String tokenType,
    required int expiresIn,
  }) = _VerifyDataResponse;

  factory VerifyDataResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyDataResponseFromJson(json);
}
