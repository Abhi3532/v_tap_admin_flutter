import 'package:v_tap_admin_flutter/core/persistence/preferences.dart';

class PreferenceHelper {
  static const user = 'user';
  static const LOGIN = "login";

  static setBoolValues() async {
    await Preferences.setBool(LOGIN, true);
  }

  static Future<bool> getBoolValues() async {
    return Preferences.getBool(LOGIN, false);
  }
  static Future<void> clearPreference() async {
    await Preferences.remove(user);
  }
}
