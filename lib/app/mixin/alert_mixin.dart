import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin AlertMixin {
  BuildContext? get context => Get.testMode ? null : Get.context;

  void showSnackBar({required String message, bool isError = false}) {
    if (context != null) {
      Get.snackbar(
        !isError ? 'Feito' : 'Erro',
        message,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        backgroundColor: !isError ? Colors.green.shade400 : Colors.red,
        colorText: Colors.white,
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
    }
  }
}
