import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences? prefs;

  static String? token;

  static void init() {
    prefs = Get.find<SharedPreferences>();
    token = prefs?.getString("token");
  }
}
