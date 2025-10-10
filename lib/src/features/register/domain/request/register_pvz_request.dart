import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_request.dart';

part 'register_pvz_request.freezed.dart';
part 'register_pvz_request.g.dart';

@freezed
class RegisterPvzRequest extends BaseRequest with _$RegisterPvzRequest {
  const factory RegisterPvzRequest({
    required String address,
    required String city,
    required List<String> files,
    required double latitude,
    required double longitude,
    required String name,
    required String square,
  }) = _RegisterPvzRequest;

  factory RegisterPvzRequest.fromJson(Map<String, dynamic> json) => _$RegisterPvzRequestFromJson(json);
}
