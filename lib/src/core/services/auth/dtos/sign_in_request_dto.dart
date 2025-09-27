import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../src/core/base/base_models/base_dto.dart';

part 'sign_in_request_dto.freezed.dart';
part 'sign_in_request_dto.g.dart';

@freezed
class SignInRequestDto extends BaseDto with _$SignInRequestDto {
  const factory SignInRequestDto({
    required String phone,
  }) = _SignInRequestDto;

  factory SignInRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestDtoFromJson(json);
}
