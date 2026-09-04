import 'dart:developer';

import 'package:get/get.dart';
import 'package:mvvm_getx/data/models/ToDoModel.dart';

import '../../core/response/api_response.dart';
import '../../data/repositories/todo_repository.dart';

class TodoViewModel extends GetxController {
  final TodoRepository repository;

  TodoViewModel(this.repository);

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  var apiResponse = ApiResponse<List<ToDoModel>>.loading().obs;

  Future<void> getTodo({required int id}) async {
    try {
      apiResponse.value = ApiResponse<List<ToDoModel>>.loading();
      update();

      final data = await repository.getTodo(id: id);

      apiResponse.value = ApiResponse<List<ToDoModel>>.completed([data]);
      update();
    } catch (e) {
      apiResponse.value = ApiResponse<List<ToDoModel>>.error(e.toString());
      update();

      log("Exception:-> $e");
      // rethrow;
    }
  }

  Future<void> getTodos() async {
    try {
      apiResponse.value = ApiResponse<List<ToDoModel>>.loading();
      update();

      final data = await repository.getTodos();

      apiResponse.value = ApiResponse<List<ToDoModel>>.completed(data);
      update();
    } catch (e) {
      apiResponse.value = ApiResponse<List<ToDoModel>>.error(e.toString());
      update();

      log("Exception:-> $e");
      // rethrow;
    }
  }

  Future<void> createTodo({required ToDoModel todo}) async {
    try {
      apiResponse.value = ApiResponse<List<ToDoModel>>.loading();
      update();

      final data = await repository.createTodo(todo: todo);

      apiResponse.value = ApiResponse<List<ToDoModel>>.completed([data]);
      update();
    } catch (e) {
      apiResponse.value = ApiResponse<List<ToDoModel>>.error(e.toString());
      update();

      log("Exception:-> $e");
      // rethrow;
    }
  }

  Future<void> updateTodo({required ToDoModel todo}) async {
    try {
      apiResponse.value = ApiResponse<List<ToDoModel>>.loading();
      update();

      final data = await repository.updateTodo(todo: todo);

      apiResponse.value = ApiResponse<List<ToDoModel>>.completed([data]);
      update();
    } catch (e) {
      apiResponse.value = ApiResponse<List<ToDoModel>>.error(e.toString());
      update();

      log("Exception:-> $e");
      // rethrow;
    }
  }

  Future<void> deleteTodo({required int id}) async {
    try {
      apiResponse.value = ApiResponse<List<ToDoModel>>.loading();
      update();

      final data = await repository.deleteTodo(id: id);

      apiResponse.value = ApiResponse<List<ToDoModel>>.completed([data]);
      update();
    } catch (e) {
      apiResponse.value = ApiResponse<List<ToDoModel>>.error(e.toString());
      update();

      log("Exception:-> $e");
      // rethrow;
    }
  }
}
