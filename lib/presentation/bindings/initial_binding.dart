import 'package:get/get.dart';
import 'package:mvvm_getx/core/network/dio_client.dart';
import 'package:mvvm_getx/data/repositories/todo_repository.dart';
import 'package:mvvm_getx/presentation/view_models/todo_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClient(), fenix: true);

    Get.lazyPut<TodoRepository>(
      () => TodoRepository(Get.find<DioClient>()),
      fenix: true,
    );

    Get.lazyPut<TodoViewModel>(
      () => TodoViewModel(Get.find<TodoRepository>()),
      fenix: true,
    );

    Get.putAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance(),
      permanent: true,
    );
  }
}
