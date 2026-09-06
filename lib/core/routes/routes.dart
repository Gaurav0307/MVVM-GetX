import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../presentation/views/create_todo.dart';
import '../../presentation/views/home_screen.dart';

class Routes {
  static const String home = '/';
  static const String createTodo = '/create-todo';

  static List<GetPage> pages() => [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: createTodo, page: () => const CreateTodoScreen()),
  ];

  static void callBack(Routing? routing) {
    if (routing!.current == home) {
      debugPrint('🏠 Home Screen');
    } else if (routing.current == createTodo) {
      debugPrint('💾 Create Todo Screen');
    }
  }
}
