import 'package:freezed_annotation/freezed_annotation.dart';

part 'airport.freezed.dart';
part 'airport.g.dart';

@freezed
abstract class Airport with _$Airport {
  const Airport._();
  const factory Airport({
    required String id,
    required String name,
    required String code,
    required String city,
    required String country,
  }) = _Airport;

  factory Airport.fromJson(Map<String, dynamic> json) => _$AirportFromJson(json);
}
