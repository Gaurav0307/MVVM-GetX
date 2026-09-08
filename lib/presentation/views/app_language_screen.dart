import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/res/colors/app_colors.dart';
import '../../core/services/localization/localization.dart';

class AppLanguageScreen extends StatefulWidget {
  const AppLanguageScreen({super.key});

  @override
  State<AppLanguageScreen> createState() => _AppLanguageScreenState();
}

class _AppLanguageScreenState extends State<AppLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "selectLanguage".tr,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(
        child: GetBuilder<LocalizationController>(
          builder: (controller) => ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray300, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(
                    controller.currentLanguage.value == "english"
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: controller.currentLanguage.value == "english"
                        ? Colors.green
                        : Colors.grey,
                    size: 30.0,
                  ),
                  title: Text(
                    "english".tr,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: controller.currentLanguage.value == "english"
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () async {
                    await controller.changeLanguageCode(
                      languageCode: "en",
                      countryCode: "IN",
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray300, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(
                    controller.currentLanguage.value == "hindi"
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: controller.currentLanguage.value == "hindi"
                        ? Colors.green
                        : Colors.grey,
                    size: 30.0,
                  ),
                  title: Text(
                    "hindi".tr,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: controller.currentLanguage.value == "hindi"
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () async {
                    await controller.changeLanguageCode(
                      languageCode: "hi",
                      countryCode: "IN",
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray300, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(
                    controller.currentLanguage.value == "bengali"
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: controller.currentLanguage.value == "bengali"
                        ? Colors.green
                        : Colors.grey,
                    size: 30.0,
                  ),
                  title: Text(
                    "bengali".tr,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: controller.currentLanguage.value == "bengali"
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () async {
                    await controller.changeLanguageCode(
                      languageCode: "bn",
                      countryCode: "IN",
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray300, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(
                    controller.currentLanguage.value == "kannada"
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: controller.currentLanguage.value == "kannada"
                        ? Colors.green
                        : Colors.grey,
                    size: 30.0,
                  ),
                  title: Text(
                    "kannada".tr,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: controller.currentLanguage.value == "kannada"
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () async {
                    await controller.changeLanguageCode(
                      languageCode: "kn",
                      countryCode: "IN",
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray300, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(
                    controller.currentLanguage.value == "urdu"
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: controller.currentLanguage.value == "urdu"
                        ? Colors.green
                        : Colors.grey,
                    size: 30.0,
                  ),
                  title: Text(
                    "urdu".tr,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: controller.currentLanguage.value == "urdu"
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () async {
                    await controller.changeLanguageCode(
                      languageCode: "ur",
                      countryCode: "IN",
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray300, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(
                    controller.currentLanguage.value == "punjabi"
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: controller.currentLanguage.value == "punjabi"
                        ? Colors.green
                        : Colors.grey,
                    size: 30.0,
                  ),
                  title: Text(
                    "punjabi".tr,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: controller.currentLanguage.value == "punjabi"
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () async {
                    await controller.changeLanguageCode(
                      languageCode: "pa",
                      countryCode: "IN",
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray300, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(
                    controller.currentLanguage.value == "gujarati"
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: controller.currentLanguage.value == "gujarati"
                        ? Colors.green
                        : Colors.grey,
                    size: 30.0,
                  ),
                  title: Text(
                    "gujarati".tr,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: controller.currentLanguage.value == "gujarati"
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () async {
                    await controller.changeLanguageCode(
                      languageCode: "gu",
                      countryCode: "IN",
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray300, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(
                    controller.currentLanguage.value == "marathi"
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: controller.currentLanguage.value == "marathi"
                        ? Colors.green
                        : Colors.grey,
                    size: 30.0,
                  ),
                  title: Text(
                    "marathi".tr,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: controller.currentLanguage.value == "marathi"
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () async {
                    await controller.changeLanguageCode(
                      languageCode: "mr",
                      countryCode: "IN",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
