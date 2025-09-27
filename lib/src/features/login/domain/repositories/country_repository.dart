import '../entities/country.dart';

abstract class CountryRepository {
  Future<List<Country>> getAllCountries();
  Future<List<Country>> searchCountries(String query);
  Future<Country?> getCountryByCode(String code);
  Future<Country?> getCountryByDialCode(String dialCode);
}
