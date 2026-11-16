import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String _isOnboardingSeenKey = 'IS_ONBOARDING_SEEN';

  static Future<bool> setOnboardingSeen(bool seen) async {
    return await _sharedPreferences.setBool(_isOnboardingSeenKey, seen);
  }

  static bool isOnboardingSeen() {
    return _sharedPreferences.getBool(_isOnboardingSeenKey) ?? false;
  }
}
