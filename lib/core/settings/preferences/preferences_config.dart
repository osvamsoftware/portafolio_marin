import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void saveThemeBrightness(bool isDark) {
    _preferences.setBool('isDark', isDark);
  }

  static bool get getThemeBrightness => _preferences.getBool("isDark") ?? false;

  static void saveAuthToken(String authToken) {
    _preferences.setString('authToken', authToken);
  }

  static String get getAuthToken => _preferences.getString('authToken') ?? '';

  static String get getFCMToken => _preferences.getString('FCMToken') ?? '';

  static void saveFCMToken(String token) async {
    await _preferences.setString('FCMToken', token);
  }
}
