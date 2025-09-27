import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../src/core/base/base_models/base_dto.dart';

part 'sign_in_response_dto.freezed.dart';
part 'sign_in_response_dto.g.dart';

@freezed
class SignInResponseDto extends BaseDto with _$SignInResponseDto {
  const factory SignInResponseDto({
    required String phone,
  }) = _SignInResponseDto;

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDtoFromJson(json);
}
