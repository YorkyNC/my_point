// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_scan_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BarcodeScanEntityImpl _$$BarcodeScanEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$BarcodeScanEntityImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$BarcodeScanEntityImplToJson(
        _$BarcodeScanEntityImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
    };
