import 'package:json_annotation/json_annotation.dart';

enum AuthStatusType {
  @JsonValue('SMS')
  sms,
  @JsonValue('PVZ')
  pvz,
  @JsonValue('DONE')
  done,
}
