import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../presentation/views/app_language_screen.dart';
import '../../presentation/views/create_todo.dart';
import '../../presentation/views/home_screen.dart';
import '../../presentation/views/no_internet_screen.dart';
import '../../presentation/views/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String createTodo = '/create-todo';
  static const String appLanguage = '/app-language';
  static const String noInternet = '/no-internet';

  static List<GetPage> pages() => [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: createTodo, page: () => const CreateTodoScreen()),
    GetPage(name: appLanguage, page: () => const AppLanguageScreen()),
    GetPage(name: noInternet, page: () => const NoInternetScreen()),
  ];

  static void callBack(Routing? routing) {
    if (routing!.current == home) {
      debugPrint('🏠 Home Screen');
    } else if (routing.current == createTodo) {
      debugPrint('💾 Create Todo Screen');
    } else if (routing.current == appLanguage) {
      debugPrint('🌍 App Language Screen');
    } else if (routing.current == noInternet) {
      debugPrint('🌐 No Internet Screen');
    }
  }
}
