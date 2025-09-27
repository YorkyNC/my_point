import 'package:flutter/material.dart';
import '../services/storage/storage_service_impl.dart';

class LanguageController {
  static final LanguageController _instance = LanguageController._internal();

  factory LanguageController() => _instance;

  LanguageController._internal();

  final StorageServiceImpl _storage = StorageServiceImpl();
  ValueNotifier<String> languageNotifier = ValueNotifier<String>('ru');

  String get currentLanguage => languageNotifier.value;

  Future<void> initialize() async {
    final savedLanguage = await _storage.getLanguageCode();
    if (savedLanguage != null) {
      languageNotifier.value = savedLanguage;
    }
  }

  Future<void> setLanguage(String languageCode) async {
    if (languageNotifier.value != languageCode) {
      await _storage.setLanguageCode(languageCode);
      languageNotifier.value = languageCode;
    }
  }
}
