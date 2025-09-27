abstract class StorageService {
  // Fcm token methods
  Future<void> setClientId(String clientId);
  String? getClientId();

  // BaseUrl monitoring methods
  Future<void> setLastKnownBaseUrl(String baseUrl);
  String? getLastKnownBaseUrl();

  // Token and authentication methods
  Future<void> setToken(String? token);
  String? getToken();
  Future<void> deleteToken();
  Future<void> setRefreshToken(String? refreshToken);
  String? getRefreshToken();
  Future<void> deleteRefreshToken();

  // Role management
  Future<void> setRole(String? role);
  String? getRole();
  Future<void> deleteRole();

  // Class management
  Future<void> setClassId(String? classId);
  String? getClassId();

  // Language preferences
  // Future<void> setLanguageCode(String code);
  // String getLanguageCode();

  // Box management
  Future<void> init();
  Future<void> openBox();
  Future<void> clear();

  // Authentication status
  bool checkLoggedIn();
  bool get isLoggedIn;

  // Introduction tracking
  Future<void> setHasSeenIntroduction(bool hasSeen);
  bool hasSeenIntroduction();
  Future<void> resetIntroductionStatus();
}
