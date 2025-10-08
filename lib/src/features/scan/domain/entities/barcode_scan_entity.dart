import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'barcode_scan_entity.freezed.dart';
part 'barcode_scan_entity.g.dart';

@freezed
class BarcodeScanEntity extends BaseEntity with _$BarcodeScanEntity {
  const factory BarcodeScanEntity({
    required String status,
    required String message,
    required DateTime timestamp,
  }) = _BarcodeScanEntity;

  factory BarcodeScanEntity.fromJson(Map<String, dynamic> json) => _$BarcodeScanEntityFromJson(json);
}
