import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_config.dart';

class Storage {
  static SharedPreferences? prefs;

  static void init() {
    prefs = Get.find<SharedPreferences>();
  }

  static String? getToken() => prefs?.getString(AppConfig.token);

  static String? getUserId() => prefs?.getString(AppConfig.userId);

  static void setToken(String token) =>
      prefs?.setString(AppConfig.token, token);

  static void setUserId(String userId) =>
      prefs?.setString(AppConfig.token, userId);
}
