import 'package:get/get.dart';

import '../../presentation/views/create_todo.dart';
import '../../presentation/views/home_screen.dart';

class Routes {
  static const String home = '/';
  static const String createTodo = '/create-todo';

  static List<GetPage> appRoutes() => [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: createTodo, page: () => const CreateTodoScreen()),
  ];
}
