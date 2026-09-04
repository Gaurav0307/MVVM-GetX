import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/presentation/views/create_todo.dart';
import 'package:mvvm_getx/presentation/views/home_screen.dart';

import 'presentation/bindings/initial_binding.dart';

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM GetX',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.lightBlueAccent),
      ),
      initialBinding: InitialBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/createTodo', page: () => const CreateTodoScreen()),
      ],
      routingCallback: (routing) {
        if (routing!.current == '/') {
          debugPrint('🏠 Home Screen');
        } else if (routing.current.startsWith('/createTodo')) {
          debugPrint('💾 Create Todo Screen');
        }
      },
      // home: const HomeScreen(),
    );
  }
}
