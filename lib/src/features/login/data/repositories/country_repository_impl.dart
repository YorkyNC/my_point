import '../../domain/entities/country.dart';
import '../../domain/repositories/country_repository.dart';
import '../datasources/remote/country_data_source.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryDataSource _dataSource;

  CountryRepositoryImpl(this._dataSource);

  @override
  Future<List<Country>> getAllCountries() async {
    return await _dataSource.getAllCountries();
  }

  @override
  Future<List<Country>> searchCountries(String query) async {
    final countries = await _dataSource.getAllCountries();

    if (query.isEmpty) {
      return countries;
    }

    final lowercaseQuery = query.toLowerCase();
    return countries
        .where((country) =>
            country.name.toLowerCase().contains(lowercaseQuery) ||
            country.dialCode.contains(query) ||
            country.code.toLowerCase().contains(lowercaseQuery))
        .toList();
  }

  @override
  Future<Country?> getCountryByCode(String code) async {
    final countries = await _dataSource.getAllCountries();
    try {
      return countries.firstWhere((country) => country.code.toLowerCase() == code.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Country?> getCountryByDialCode(String dialCode) async {
    final countries = await _dataSource.getAllCountries();
    try {
      return countries.firstWhere((country) => country.dialCode == dialCode);
    } catch (e) {
      return null;
    }
  }
}
