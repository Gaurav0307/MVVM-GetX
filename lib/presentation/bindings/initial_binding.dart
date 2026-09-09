import 'package:get/get.dart';
import 'package:mvvm_getx/core/network/dio_client.dart';
import 'package:mvvm_getx/data/repositories/todo_repository.dart';
import 'package:mvvm_getx/presentation/view_models/todo_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/localization/localization.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.putAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance(),
      permanent: true,
    );

    Get.lazyPut<LocalizationController>(
      () => LocalizationController(),
      fenix: true,
    );

    Get.lazyPut<DioClient>(() => DioClient(), fenix: true);

    Get.lazyPut<TodoRepository>(
      () => TodoRepository(Get.find<DioClient>()),
      fenix: true,
    );

    // Use Get.put() with permanent: true for ViewModels
    Get.put<TodoViewModel>(
      TodoViewModel(Get.find<TodoRepository>()),
      permanent: true,
    );
  }
}
