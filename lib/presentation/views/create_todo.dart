import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/data/models/ToDoModel.dart';

import '../../core/response/status.dart';
import '../../core/routes/routes.dart';
import '../view_models/todo_view_model.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  var todoController = Get.find<TodoViewModel>();

  final _formKey = GlobalKey<FormState>();

  final _userIdController = TextEditingController();
  final _titleController = TextEditingController();

  bool _completed = false;

  @override
  void dispose() {
    _userIdController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _createTodo() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final todo = {
        "userId": int.parse(_userIdController.text),
        "title": _titleController.text.trim(),
        "completed": _completed,
      };

      debugPrint(todo.toString());

      await todoController.createTodo(todo: ToDoModel.fromJson(todo));

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todo created successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: () => Get.toNamed(Routes.appLanguage),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _userIdController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'User ID',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter user id';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _titleController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                CheckboxListTile(
                  value: _completed,
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Completed'),
                  onChanged: (value) {
                    setState(() {
                      _completed = value ?? false;
                    });
                  },
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed:
                          todoController.apiResponse.value.status ==
                              Status.loading
                          ? null
                          : _createTodo,
                      child:
                          todoController.apiResponse.value.status ==
                              Status.loading
                          ? const CircularProgressIndicator()
                          : const Text('Create Todo'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
