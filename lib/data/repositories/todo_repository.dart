import 'package:mvvm_getx/core/network/dio_client.dart';

import '../../core/constants/api_constants.dart';
import '../models/ToDoModel.dart';

class TodoRepository {
  final DioClient apiClient;

  TodoRepository(this.apiClient);

  Future<ToDoModel> getTodo({required int id}) async {
    var endpoint = ApiConstants.todos.replaceAll("{id}", "$id");

    final response = await apiClient.get(endpoint);

    return ToDoModel.fromJson(response);
  }

  Future<List<ToDoModel>> getTodos() async {
    var endpoint = ApiConstants.todos;

    final response = await apiClient.get(endpoint);

    return (response as List).map((e) => ToDoModel.fromJson(e)).toList();
  }
}
