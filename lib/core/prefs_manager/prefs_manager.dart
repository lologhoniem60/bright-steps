import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String _isOnboardingSeenKey = 'IS_ONBOARDING_SEEN';
  static const String _parentIdKey = 'PARENT_ID';
  static const String _fullNameKey = 'FULL_NAME';
  static const String _emailKey = 'EMAIL';
  static const String _phoneKey = 'PHONE';

  static Future<bool> setOnboardingSeen(bool seen) async {
    return await _sharedPreferences.setBool(_isOnboardingSeenKey, seen);
  }

  static bool isOnboardingSeen() {
    return _sharedPreferences.getBool(_isOnboardingSeenKey) ?? false;
  }

  static Future<void> saveUserData({
    int? parentId,
    String? fullName,
    String? email,
    String? phone,
  }) async {
    if (parentId != null) await _sharedPreferences.setInt(_parentIdKey, parentId);
    if (fullName != null) await _sharedPreferences.setString(_fullNameKey, fullName);
    if (email != null) await _sharedPreferences.setString(_emailKey, email);
    if (phone != null) await _sharedPreferences.setString(_phoneKey, phone);
  }

  static int? getParentId() => _sharedPreferences.getInt(_parentIdKey);
  static String? getFullName() => _sharedPreferences.getString(_fullNameKey);
  static String? getEmail() => _sharedPreferences.getString(_emailKey);
  static String? getPhone() => _sharedPreferences.getString(_phoneKey);
}
