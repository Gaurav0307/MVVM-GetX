import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/core/response/status.dart';
import 'package:mvvm_getx/presentation/view_models/todo_view_model.dart';

import '../../core/routes/routes.dart';

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
          switch (todoController.apiResponse.value.status!) {
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
                      itemCount: todoController.apiResponse.value.data?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text("${index + 1}"),
                          title: Text(
                            "${todoController.apiResponse.value.data?[index].title}",
                          ),
                          trailing: Checkbox(
                            value: todoController
                                .apiResponse
                                .value
                                .data?[index]
                                .completed,
                            onChanged: (value) {
                              todoController.apiResponse.value.data![index] =
                                  todoController.apiResponse.value.data![index]
                                      .copyWith(
                                        userId: todoController
                                            .apiResponse
                                            .value
                                            .data![index]
                                            .userId,
                                        id: todoController
                                            .apiResponse
                                            .value
                                            .data![index]
                                            .id,
                                        title: todoController
                                            .apiResponse
                                            .value
                                            .data![index]
                                            .title,
                                        completed: value!,
                                      );
                              todoController.updateTodo(
                                todo: todoController
                                    .apiResponse
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
                child: Text("${todoController.apiResponse.value.message}"),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.createTodo),
        child: const Icon(Icons.add),
      ),
    );
  }
}
