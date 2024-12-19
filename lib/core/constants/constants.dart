class Constants {
  static String lang = 'ar';

  // STORAGE KEYS
  static const String kLanguage = 'kLanguage';
  static const String kUserId = 'kUserId';
  static const String kToken = 'kToken';
  static const String kFcmToken = 'fcmToken';
  static const String kUserEmail = 'kUserEmail';
  static const String kUserPassword = 'kUserPassword';
  static const String kShowIntro = 'kShowIntro';
  static const String kIsDarkMode = 'kIsDarkMode';
  static const String kRememberMe = 'kRememberMe';
  static const String kUserLoggedIn = 'kUserLoggedIn';
  static const String kUserData = 'kUserData';
  static const String kUserName = 'kUserName';
  static const String kUserImage = 'kUserImage';
  static const String kHideFlag = 'kHideFlag';
  static const String kCurrentVersion = 'kCurrentVersion';
  static const String kAndroidUrl = 'kAndroidUrl';
  static const String kIOSUrl = 'kIOSUrl';
  static const String version = '1.0.8';
  // General Strings
  static const String localizationsPATH = 'assets/translations';

//////////////
  // SCHEMES
  String locationUrl(String latitude, String longitude) =>
      "geo:$latitude,$longitude";

  static String webUrl(String url) => "https://$url";

  static String emailUrl(String email) => "mailto:$email";
  static const String telScheme = 'tel';

/////////////
  static const String googleAPIKey = "";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
