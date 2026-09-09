import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/core/res/fonts/app_fonts.dart';

import 'core/res/colors/app_colors.dart';
import 'core/res/localization/localization.dart';
import 'core/routes/routes.dart';
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
    return GestureDetector(
      onTap: () {
        // Hide keyboard when tapping outside of text fields.
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        translations: TextData(), // your translations
        locale: const Locale(
          'en',
          'IN',
        ), // translations will be displayed in that locale
        fallbackLocale: const Locale('hi', 'IN'),
        debugShowCheckedModeBanner: false,
        title: 'MVVM GetX',
        theme: ThemeData(
          primaryColor: AppColors.orangePrimary,
          fontFamily: AppFonts.poppins,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.orangePrimary,
          ),
        ),
        initialBinding: InitialBinding(),
        initialRoute: Routes.splash,
        getPages: Routes.pages(),
        routingCallback: Routes.callBack,
        // home: const HomeScreen(),
      ),
    );
  }
}
