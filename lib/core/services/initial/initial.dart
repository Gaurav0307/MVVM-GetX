import 'package:get/get.dart';

import '../../../presentation/view_models/todo_view_model.dart';
import '../localization/localization.dart';

class InitialService {
  static Future<void> loadData() async {
    List<Future> futures = [];

    futures.addAll([Get.find<TodoViewModel>().getTodos()]);

    await Future.wait(futures);

    await Get.find<LocalizationController>().setLanguage();
  }
}
