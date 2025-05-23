import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController logoController;
  late Animation<Offset> logoAnimation;

  late AnimationController textController;
  late Animation<Offset> textAnimation;

  late AnimationController bottomImageController;
  late Animation<Offset> bottomImageAnimation;

  @override
  void onInit() {
    super.onInit();
    StartTimer();

    logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    logoAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: logoController, curve: Curves.easeOut));

    textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    textAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: textController, curve: Curves.easeOut));

    bottomImageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    bottomImageAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: bottomImageController, curve: Curves.easeOut),
    );

    logoController.forward();
    textController.forward();
    bottomImageController.forward();
  }

  void StartTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/SliderPageView');
    });
  }

  @override
  void onClose() {
    logoController.dispose();
    textController.dispose();
    bottomImageController.dispose();
    super.onClose();
  }
}
