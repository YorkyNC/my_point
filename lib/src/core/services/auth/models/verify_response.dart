import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'verify_response.freezed.dart';
part 'verify_response.g.dart';

@freezed
class VerifyResponse extends BaseEntity with _$VerifyResponse {
  const factory VerifyResponse({
    required String status,
    required Map<String, dynamic>? data,
  }) = _VerifyResponse;

  factory VerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseFromJson(json);
}
