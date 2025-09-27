import '../models/airport.dart';

abstract class AirportRepositoryImpl {
  Future<List<Airport>> getAirports();
}
