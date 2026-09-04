import 'package:mvvm_getx/core/network/dio_client.dart';

import '../../core/constants/api_constants.dart';
import '../models/ToDoModel.dart';

class TodoRepository {
  final DioClient apiClient;

  TodoRepository(this.apiClient);

  Future<ToDoModel> getTodo({required int id}) async {
    var endpoint = ApiConstants.todo.replaceAll("{id}", "$id");

    final response = await apiClient.get(endpoint);

    return ToDoModel.fromJson(response.data);
  }

  Future<List<ToDoModel>> getTodos() async {
    var endpoint = ApiConstants.todos;

    final response = await apiClient.get(endpoint);

    return (response.data as List).map((e) => ToDoModel.fromJson(e)).toList();
  }

  Future<ToDoModel> createTodo({required ToDoModel todo}) async {
    var endpoint = ApiConstants.createTodo;

    final response = await apiClient.post(endpoint, data: todo.toJson());

    return ToDoModel.fromJson(response.data);
  }

  Future<ToDoModel> updateTodo({required ToDoModel todo}) async {
    // var endpoint = ApiConstants.updateTodo.replaceAll("{id}", "${todo.id}");

    // Temporary: So that newly created todo can be updated.
    var endpoint = ApiConstants.updateTodo.replaceAll("{id}", "1");

    final response = await apiClient.put(endpoint, data: todo.toJson());

    return ToDoModel.fromJson(response.data);
  }

  Future<ToDoModel> deleteTodo({required int id}) async {
    var endpoint = ApiConstants.deleteTodo.replaceAll("{id}", "$id");

    final response = await apiClient.delete(endpoint);

    return ToDoModel.fromJson(response.data);
  }
}
