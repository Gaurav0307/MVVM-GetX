import 'package:get/get.dart';
import 'package:mvvm_getx/data/models/ToDoModel.dart';

import '../../core/response/api_response.dart';
import '../../data/repositories/todo_repository.dart';

class TodoViewModel extends GetxController {
  final TodoRepository repository;

  TodoViewModel(this.repository);

  final Rx<ApiResponse<ToDoModel>> todoResponse =
      ApiResponse<ToDoModel>.loading().obs;

  final Rx<ApiResponse<List<ToDoModel>>> todosResponse =
      ApiResponse<List<ToDoModel>>.loading().obs;

  Future<void> getTodo({required int id}) async {
    try {
      todoResponse.value = ApiResponse<ToDoModel>.loading();

      final data = await repository.getTodo(id: id);

      todoResponse.value = ApiResponse.completed(data);
    } catch (e) {
      todoResponse.value = ApiResponse.error(e.toString());
    }
  }

  Future<void> getTodos() async {
    try {
      todosResponse.value = ApiResponse<List<ToDoModel>>.loading();

      final data = await repository.getTodos();

      todosResponse.value = ApiResponse.completed(data);
    } catch (e) {
      todosResponse.value = ApiResponse.error(e.toString());
    }
  }
}
