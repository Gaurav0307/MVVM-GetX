import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_config.dart';

class Global {
  static SharedPreferences? prefs;

  static String? token;

  static String? userId;

  static void init() {
    prefs = Get.find<SharedPreferences>();
    token = prefs?.getString(AppConfig.token);
    userId = prefs?.getString(AppConfig.userId);
  }
}
