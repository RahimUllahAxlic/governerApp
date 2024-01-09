import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(
    {String title = 'Error',
      required String message,
      IconData icon = Icons.error,
      Color backgroundColor = Colors.red}) {
  Get.snackbar(
    title,
    message,
    icon: Icon(icon, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: const Duration(seconds: 2),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
