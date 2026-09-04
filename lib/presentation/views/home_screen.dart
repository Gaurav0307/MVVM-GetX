import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/core/response/status.dart';
import 'package:mvvm_getx/presentation/view_models/todo_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MVVM GetX')),
      body: GetBuilder<TodoViewModel>(
        builder: (todoController) {
          switch (todoController.todosResponse.value.status!) {
            case Status.loading:
              return Center(child: CircularProgressIndicator());
            case Status.completed:
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    color: Colors.black87,
                    child: Center(
                      child: Text(
                        'Todos loaded successfully',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          todoController.todosResponse.value.data?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text("${index + 1}"),
                          title: Text(
                            "${todoController.todosResponse.value.data?[index].title}",
                          ),
                          trailing: Checkbox(
                            value: todoController
                                .todosResponse
                                .value
                                .data?[index]
                                .completed,
                            onChanged: (value) {
                              todoController.todosResponse.value.data![index] =
                                  todoController
                                      .todosResponse
                                      .value
                                      .data![index]
                                      .copyWith(
                                        userId: todoController
                                            .todosResponse
                                            .value
                                            .data![index]
                                            .userId,
                                        id: todoController
                                            .todosResponse
                                            .value
                                            .data![index]
                                            .id,
                                        title: todoController
                                            .todosResponse
                                            .value
                                            .data![index]
                                            .title,
                                        completed: value!,
                                      );
                              todoController.updateTodo(
                                todo: todoController
                                    .todosResponse
                                    .value
                                    .data![index],
                              );
                            },
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            case Status.error:
              return Center(
                child: Text("${todoController.todosResponse.value.message}"),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/createTodo'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
