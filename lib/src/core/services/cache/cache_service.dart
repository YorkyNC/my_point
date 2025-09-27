import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  final SharedPreferences _prefs;
  static const String _cachePrefix = 'profile_cache_';
  static const Duration _defaultCacheDuration = Duration(minutes: 15);

  CacheService(this._prefs);

  Future<void> cacheData(String key, dynamic data, {Duration? duration}) async {
    final cacheEntry = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'expiryTime': duration?.inMilliseconds ?? _defaultCacheDuration.inMilliseconds,
    };
    await _prefs.setString('$_cachePrefix$key', jsonEncode(cacheEntry));
  }

  dynamic getCachedData(String key) {
    final cachedJson = _prefs.getString('$_cachePrefix$key');
    if (cachedJson == null) return null;

    final cacheEntry = jsonDecode(cachedJson);
    final timestamp = cacheEntry['timestamp'] as int;
    final expiryTime = cacheEntry['expiryTime'] as int;

    if (DateTime.now().millisecondsSinceEpoch - timestamp > expiryTime) {
      // Cache expired, remove it
      _prefs.remove('$_cachePrefix$key');
      return null;
    }

    return cacheEntry['data'];
  }

  Future<void> clearCache() async {
    final keys = _prefs.getKeys();
    for (final key in keys) {
      if (key.startsWith(_cachePrefix)) {
        await _prefs.remove(key);
      }
    }
  }
}
