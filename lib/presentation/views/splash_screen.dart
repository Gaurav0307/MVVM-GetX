import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/core/res/assets/app_assets.dart';

import '../../core/res/colors/app_colors.dart';
import '../../core/routes/routes.dart';
import '../../core/services/connectivity/internet_connectivity.dart';
import '../../core/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    loadData();

    super.initState();
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 5), () {
      Utils.loadInitialData();

      // Internet Connectivity listener
      InternetConnectivity.addConnectivityListener(
        () => Utils.loadInitialData(),
      );
    });

    Get.offNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, //It should be false to work
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        await _onBackPressed();
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            color: AppColors.black,
            image: const DecorationImage(
              image: AssetImage(AppAssets.splash),
              fit: BoxFit.fitHeight,
              opacity: 0.5,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 180.0),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 35,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      blurRadius: 12.0,
                      color: AppColors.white,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "appName".tr,
                      speed: const Duration(milliseconds: 200),
                    ),
                    FlickerAnimatedText("appName".tr),
                    FlickerAnimatedText("appName".tr),
                  ],
                  onTap: () {
                    if (kDebugMode) {
                      print("Tap Event");
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onBackPressed() async {
    await showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("confirm".tr, style: const TextStyle(color: Colors.red)),
          content: Text("doYouWantToExitTheApp".tr),
          actions: <Widget>[
            TextButton(
              child: Text("no".tr, style: const TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop(); //Will not exit the App
              },
            ),
            TextButton(
              child: Text("yes".tr, style: const TextStyle(color: Colors.red)),
              onPressed: () {
                SystemNavigator.pop();
                Navigator.of(context).pop(); //Will exit the App
              },
            ),
          ],
        );
      },
    );
  }
}
