import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OtpverificationController extends GetxController {
  Timer? _timer;
  int remainingseconds = 1;
  final time = '00:00'.obs;

  @override
  void onReady() {
    _startTimer(60);
    super.onReady();
  }

  List<TextEditingController> otpcontroller = List.generate(
    4,
    (_) => TextEditingController(),
  );
  List<FocusNode> optFocusNode = List.generate(4, (_) => FocusNode());

  void onChanged(String value, int index) {
    if (value.length == 1 && index < otpcontroller.length - 1) {
      optFocusNode[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      optFocusNode[index - 1].requestFocus();
    }
  }

  String getOtp() {
    return otpcontroller.map((c) => c.text).join();
  }

  @override
  void onClose() {
    for (var controller in otpcontroller) {
      controller.dispose();
    }
    for (var node in optFocusNode) {
      node.dispose();
    }
    super.onClose();
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingseconds = seconds;
    _timer = Timer.periodic(duration, (timer) {
      if (remainingseconds == 0) {
        _timer?.cancel();
      } else {
        int minutes = remainingseconds ~/ 60;
        int seconds = remainingseconds % 60;
        time.value =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        remainingseconds--;
      }
    });
  }
}
