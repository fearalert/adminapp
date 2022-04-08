import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  final emailController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}
