import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabStateController extends GetxController {
  late PageController _pageController = PageController();
  Rx<Color>? selectedColor = Colors.white.obs;
  // RxInt? _page = 0.obs;

  Color? get color => selectedColor!.value;

  change(Color color) {
    selectedColor!.value = color;
  }

  @override
  void onInit() {
    super.onInit();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
