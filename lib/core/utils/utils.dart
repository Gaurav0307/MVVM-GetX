import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_getx/core/constants/api_constants.dart';
import 'package:mvvm_getx/core/helper/dialog_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  // Function to convert a string to a DateTime object
  static DateTime convertStringToDateTime(String dateTimeString) {
    return DateTime.parse(dateTimeString);
  }

  /// Convert DateTime String to formatted String.
  /// Common formats: 'dd/MM/yyyy', 'MM/dd/yyyy', 'dd-MM-yyyy', 'MM-dd-yyyy', 'yyyy/MM/dd',
  /// 'yyyy-MM-dd', 'dd MMM yyyy', 'MMM dd, yyyy', 'yyyy-MM-dd HH:mm:ss', 'dd/MM/yyyy HH:mm',
  /// 'MM/dd/yyyy hh:mm a',
  static String formatDate(String dateTimeString, String format) {
    try {
      if (dateTimeString.isEmpty) {
        return 'N/A';
      }

      if (format.isEmpty) {
        return 'N/A';
      }

      DateTime dateTime = DateTime.parse(dateTimeString);
      return DateFormat(format).format(dateTime);
    } catch (e) {
      debugPrint("formatDate() error: $e");
      return 'N/A';
    }
  }

  bool isDateOlderThanGivenDays(String dateString, int days) {
    // Define the date format corresponding to the input string
    DateFormat format = DateFormat('MM/dd/yyyy hh:mm:ss a');
    // Parse the string to a DateTime object
    DateTime dateTime = format.parse(dateString);
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(dateTime);
    return difference.inDays > days;
  }

  static Future<bool> checkStoragePermission() async {
    if (!Platform.isAndroid) {
      return true;
    }

    var status = await Permission.storage.status;

    if (status.isGranted) {
      return true;
    }

    status = await Permission.storage.request();

    return status.isGranted;
  }

  static Future<File?> moveFileToTempDirectory(File file) async {
    try {
      // Get the temporary directory
      final tempDir = await getTemporaryDirectory();

      // Generate a unique filename based on the current timestamp
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final uniqueFileName = 'image_$timestamp.${file.path.split(".").last}';

      // Create a new File object in the temporary directory
      final tempFile = File('${tempDir.path}/$uniqueFileName');

      // Copy the selected file to the temporary directory
      await file.copy(tempFile.path);

      // You can now use `tempFile` for further processing or displaying the file
      debugPrint('File moved to temporary directory: ${tempFile.path}');

      return tempFile;
    } catch (e) {
      debugPrint('Error moving file: $e');
    }

    return null;
  }

  static Future<void> moveFileToDownloadsDirectory(
    File file,
    BuildContext context,
  ) async {
    try {
      var savePath = file.path;
      var fileName = file.path.split("/").last;

      await File(savePath).copy('/storage/emulated/0/Download/$fileName');
      await File(savePath).delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Download finished. Please check Download folder of your device.",
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Download failed!\nException - $e")),
      );
    }
  }

  static void download(BuildContext context, String fileUrl) async {
    final hasPermission = await checkStoragePermission();

    if (hasPermission) {
      final fileName =
          "${DateTime.now().millisecondsSinceEpoch}_${fileUrl.split("/").last}";
      final directory = await getApplicationDocumentsDirectory();
      final savePath = "${directory.path}/$fileName";

      try {
        DialogHelper.loadingDialog("Downloading...");

        await Dio().download(
          fileUrl,
          savePath,
          options: Options(headers: {HttpHeaders.acceptEncodingHeader: "*"}),
          onReceiveProgress: (received, total) {},
        );

        await File(savePath).copy('/storage/emulated/0/Download/$fileName');
        await File(savePath).delete();

        DialogHelper.hideLoadingDialog();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Download finished. Please check Download folder of your device.",
            ),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Download failed!\nException - $e")),
        );
      }
    } else {
      if (kDebugMode) {
        print("Permission Denied!");
      }
    }
  }

  static String capitalizeWords(String text) {
    // Split the input text into words
    List<String> words = text.split(' ');

    // Capitalize the first letter of each word
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }

    return words.join(' ');
  }

  static bool isBlank(String text) {
    // Check if the text consists of only blank spaces
    return text.trim().isEmpty;
  }

  static String getNameInitials({required String name}) {
    String initials = '';

    List<String> words = name.contains(" ") ? name.split(" ") : [name];

    for (var word in words) {
      if (word.isNotEmpty) {
        initials += word[0];
      }
    }

    return initials.toUpperCase();
  }

  static Color getRandomColors() {
    // List of rainbow colors
    final List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];

    // Generate a random index
    final randomIndex = Random().nextInt(colors.length);

    // Return a random color from the rainbowColors list
    return colors[randomIndex];
  }

  static String getProperFileUrl(String fileUrl) {
    String updatedFileUrl = fileUrl.contains("\\")
        ? "${ApiConstants.baseUrl}/${fileUrl.replaceAll("\\", "/")}"
        : "${ApiConstants.baseUrl}/$fileUrl";
    return updatedFileUrl;
  }

  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode next,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}
