import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'qr_scan_entity.freezed.dart';
part 'qr_scan_entity.g.dart';

@freezed
class QrScanEntity extends BaseEntity with _$QrScanEntity {
  const factory QrScanEntity({
    required String status,
    required String message,
    required DateTime timestamp,
  }) = _QrScanEntity;

  factory QrScanEntity.fromJson(Map<String, dynamic> json) => _$QrScanEntityFromJson(json);
}
