import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/core/res/assets/app_assets.dart';

import '../../core/res/colors/app_colors.dart';
import '../../core/res/fonts/app_fonts.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                height: 180,
                width: 180,
                decoration: const BoxDecoration(),
                child: Image.asset(AppAssets.noInternet),
              ),
              Text(
                "noInternet".tr,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              SizedBox(
                width: 250.0,
                child: Text(
                  "thereIsNoInternetConnectivity".tr,
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: AppFonts.roboto,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onBackPressed() {}
}
