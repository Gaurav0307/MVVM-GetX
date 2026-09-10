import 'dart:ui';

import 'package:get/get.dart';

import '../../constants/app_config.dart';
import '../../storage/storage.dart';

class LocalizationController extends GetxController {
  var currentLanguage = 'english'.obs;

  Future<void> changeLanguageCode({
    required String languageCode,
    required String countryCode,
  }) async {
    Storage.prefs?.setString(AppConfig.languageCode, languageCode);
    Storage.prefs?.setString(AppConfig.countryCode, countryCode);
    if (languageCode == 'en') {
      currentLanguage.value = 'english';
    } else if (languageCode == 'hi') {
      currentLanguage.value = 'hindi';
    } else if (languageCode == 'bn') {
      currentLanguage.value = 'bengali';
    } else if (languageCode == 'kn') {
      currentLanguage.value = 'kannada';
    } else if (languageCode == 'ur') {
      currentLanguage.value = 'urdu';
    } else if (languageCode == 'pa') {
      currentLanguage.value = 'punjabi';
    } else if (languageCode == 'gu') {
      currentLanguage.value = 'gujarati';
    } else if (languageCode == 'mr') {
      currentLanguage.value = 'marathi';
    }
    Get.updateLocale(Locale(languageCode, countryCode));
  }

  Future<void> setLanguage() async {
    String languageCode =
        Storage.prefs?.getString(AppConfig.languageCode) ?? 'en';
    String countryCode =
        Storage.prefs?.getString(AppConfig.countryCode) ?? 'IN';
    if (languageCode == 'en') {
      currentLanguage.value = 'english';
    } else if (languageCode == 'hi') {
      currentLanguage.value = 'hindi';
    } else if (languageCode == 'bn') {
      currentLanguage.value = 'bengali';
    } else if (languageCode == 'kn') {
      currentLanguage.value = 'kannada';
    } else if (languageCode == 'ur') {
      currentLanguage.value = 'urdu';
    } else if (languageCode == 'pa') {
      currentLanguage.value = 'punjabi';
    } else if (languageCode == 'gu') {
      currentLanguage.value = 'gujarati';
    } else if (languageCode == 'mr') {
      currentLanguage.value = 'marathi';
    }
    Get.updateLocale(Locale(languageCode, countryCode));
  }
}
