import 'dart:developer';

import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/login/data/datasources/remote/country_data_source.dart';
import 'package:my_point/src/features/login/data/repositories/country_repository_impl.dart';
import 'package:my_point/src/features/login/domain/entities/country.dart';
import 'package:my_point/src/features/login/domain/repositories/country_repository.dart';
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';

class CountrySelection {
  final String dialCode;
  final String flag;

  const CountrySelection({
    required this.dialCode,
    required this.flag,
  });
}

class NumberSearchModal extends StatefulWidget {
  final AuthorizationState state;
  const NumberSearchModal({super.key, required this.state});

  @override
  State<NumberSearchModal> createState() => _NumberSearchPageState();
}

class _NumberSearchPageState extends State<NumberSearchModal> {
  final TextEditingController _searchController = TextEditingController();
  final CountryRepository _countryRepository = CountryRepositoryImpl(CountryDataSourceImpl());
  List<Country> _filteredCountries = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeCountries();
    _searchController.addListener(_filterCountries);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _initializeCountries() async {
    try {
      final countries = await _countryRepository.getAllCountries();
      if (mounted) {
        setState(() {
          _filteredCountries = countries;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _filterCountries() async {
    try {
      final query = _searchController.text;
      final countries = await _countryRepository.searchCountries(query);
      if (mounted) {
        setState(() {
          _filteredCountries = countries;
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  style: context.typography.smallParagraphMedium.copyWith(
                    color: context.colors.black,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    filled: true,
                    fillColor: context.colors.dividerColor,
                    prefixIcon: Icon(
                      context.icons.magnifying_glass__glass_search_magnifying,
                      size: 24,
                      color: context.colors.textGray,
                    ),
                    hintText: 'Поиск',
                    hintStyle: context.typography.smallParagraphMedium.copyWith(
                      color: context.colors.textGray,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: context.colors.blue,
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredCountries.length,
                    itemBuilder: (context, index) {
                      final country = _filteredCountries[index];
                      return ListTile(
                        leading: Text(
                          country.flag,
                          style: TextStyle(fontSize: 24),
                        ),
                        title: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          '${country.name} (${country.dialCode})',
                          style: context.typography.smallParagraphMedium.copyWith(
                            color: context.colors.black,
                          ),
                        ),
                        trailing: widget.state.phoneCode == country.dialCode
                            ? Container(
                                width: 21.5,
                                height: 21.5,
                                decoration: BoxDecoration(
                                  color: context.colors.mainAccent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  size: 16,
                                  Icons.check_rounded,
                                  color: context.colors.white,
                                ),
                              )
                            : SizedBox.shrink(),
                        onTap: () {
                          context.pop(CountrySelection(
                            dialCode: country.dialCode,
                            flag: country.flag,
                          ));
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
