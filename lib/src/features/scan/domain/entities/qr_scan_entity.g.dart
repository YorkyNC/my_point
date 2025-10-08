// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_scan_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrScanEntityImpl _$$QrScanEntityImplFromJson(Map<String, dynamic> json) =>
    _$QrScanEntityImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$QrScanEntityImplToJson(_$QrScanEntityImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
    };
