import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/core/network/app_exceptions.dart';

class DialogHelper {
  /// Dialog
  static void dialog({
    required String title,
    required String description,
    Icon icon = const Icon(Icons.info, color: Colors.blueAccent, size: 30),
  }) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(height: 5.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(description, style: const TextStyle(fontSize: 16.0)),
              const SizedBox(height: 8.0),
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text(
                  'Close',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Loading Dialog
  static void loadingDialog([String? message]) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: Colors.white),
              const SizedBox(height: 8.0),
              Text(
                message ?? 'Loading...',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Hide Loading Dialog
  static void hideLoadingDialog() {
    if (Get.isDialogOpen!) Get.back();
  }

  /// Toast
  static void toast({required String message, bool isLong = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    );
  }

  /// Error SnackBar
  static void errorSnackBar({
    String title = 'Error',
    String? description = 'Something went wrong',
  }) {
    Get.snackbar(
      "",
      "",
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.black54,
      icon: const Icon(Icons.error_outline, color: Colors.orange, size: 40),
      titleText: Text(
        title,
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
      ),
      messageText: Text(
        "$description",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  /// Info SnackBar
  static void infoSnackBar({
    String title = 'Info',
    String? description = 'Description',
  }) {
    Get.snackbar(
      "",
      "",
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.black54,
      icon: const Icon(Icons.info_outline, color: Colors.blue, size: 40),
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.w600,
        ),
      ),
      messageText: Text(
        "$description",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  static void exceptionSnackBar(AppException e) {
    if (e is BadRequestException ||
        e is UnauthorizedException ||
        e is ForbiddenException ||
        e is NotFoundException ||
        e is ConflictException ||
        e is ValidationException ||
        e is InternalServerException ||
        e is ServiceUnavailableException ||
        e is FetchDataException) {
      errorSnackBar(title: e.prefix ?? 'Error', description: e.message);
    }
  }
}
