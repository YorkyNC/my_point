class EndPoints {
  static const String baseUrl =
      'https://jet-join-develop.greeneye.kz/api/v1.0/mobile';
  // Auth
  static const register = "/v1/auth/register";
  static const login = "/login";
  static const logout = "/v1/auth/logout";
  static const passwordReset = "/password-reset-request/";
  static const refreshToken = "/refresh";
  static const forgotPassword = "/password-reset-request";
  static const temporaryPassword = "/temporary-password";
  static const permanentPassword = "/permanent-password";
  static const getUser = "/v1/auth/profile";

  // Attachment
  static const attachment = "/v1/attachment";

  // Post
  static const post = "/v1/post";

  // Feed
  static const feed = "/v1/feed";

  // School
  static const school = "/school";

  // Parent
  static const parent = "/v1/parent";

  // Transcriptions
  static const transcription = "/v1/transcriptions";

  // Process Feedback
  static const processFeedback = "/v1/process-feedback";

  // Teacher
  static const teacher = "/v1/teacher";

  // Student
  static const student = "/v1/student";

  //Report-Record
  static const reportRecord = "/v1/report-record";
}
