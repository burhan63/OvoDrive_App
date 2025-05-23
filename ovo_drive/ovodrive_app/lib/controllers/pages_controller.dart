import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PageControllerGetX extends GetxController {
  PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
