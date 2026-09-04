import 'package:get/get.dart';
import 'package:mvvm_getx/core/network/dio_client.dart';
import 'package:mvvm_getx/data/repositories/todo_repository.dart';
import 'package:mvvm_getx/presentation/view_models/todo_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    var dioClient = Get.put(DioClient());

    var todoRepository = Get.put(TodoRepository(dioClient));

    Get.lazyPut<TodoViewModel>(
      () => TodoViewModel(todoRepository),
      fenix: true,
    );

    Get.putAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance(),
      permanent: true,
    );
  }
}
