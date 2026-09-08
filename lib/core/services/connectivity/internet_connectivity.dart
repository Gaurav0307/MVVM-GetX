import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class InternetConnectivity {
  static bool isInternet = true;
  static void addConnectivityListener(void Function() callback) {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result.any((e) => e == ConnectivityResult.none)) {
        isInternet = false;
        Get.toNamed(Routes.noInternet);
      } else {
        if (!isInternet) {
          Get.back();
          callback();
        }
        isInternet = true;
      }
    });
  }
}
