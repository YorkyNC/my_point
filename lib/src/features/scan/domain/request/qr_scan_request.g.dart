// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_scan_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrScanRequestImpl _$$QrScanRequestImplFromJson(Map<String, dynamic> json) =>
    _$QrScanRequestImpl(
      encodedData: json['encoded_data'] as String,
      currentPvzId: json['current_pvz_id'] as String,
    );

Map<String, dynamic> _$$QrScanRequestImplToJson(_$QrScanRequestImpl instance) =>
    <String, dynamic>{
      'encoded_data': instance.encodedData,
      'current_pvz_id': instance.currentPvzId,
    };
