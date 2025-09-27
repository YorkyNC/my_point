import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'data_response.freezed.dart';
part 'data_response.g.dart';

@freezed
class DataResponse extends BaseEntity with _$DataResponse {
  const factory DataResponse({
    required dynamic userId,
  }) = _DataResponse;

  factory DataResponse.fromJson(Map<String, dynamic> json) => _$DataResponseFromJson(json);
}
