class EndPoints {
  static const String baseUrl = 'https://mypoint.kz/api';
  // Auth
  static const signIn = "/user/sign-in";
  static const signUp = "/user/sign-up";
  static const refreshToken = "/user/refresh-token";
  static const barcodeScan = "/orders/scan";
  static const qrScan = "/orders/scan-qr";
  static const privacyPolicy = "https://mypoint.kz/#/privacy";
  static const requestOtpCode = "/contract/send-sms-code";
  static const verifyOtp = "/contract/sms/verify";
  static const agreement = "https://mypoint.kz/#/user-dashboard/sign-agreement";
}
