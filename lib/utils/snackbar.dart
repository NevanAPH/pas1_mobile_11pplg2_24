import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/utils/theme.dart';

class Snackbar {
  static success({required String message, String? title}) {
    return Get.snackbar(
      title ?? 'Success',
      message,
      backgroundColor: AppTheme.secondaryColorDark,
      colorText: AppTheme.white90,
      icon: const Icon(Icons.check_circle, color: AppTheme.white90, size: 28),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      animationDuration: const Duration(milliseconds: 400),
      shouldIconPulse: false,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED,
      margin: EdgeInsets.zero
    );
  }

  static error({required String message, String? title}) {
    return Get.snackbar(
      title ?? 'Error',
      message,
      backgroundColor: AppTheme.errorColorDark,
      colorText: AppTheme.white90,
      icon: const Icon(Icons.error, color: AppTheme.white90, size: 28),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 400),
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED,
      margin: EdgeInsets.zero
    );
  }
}