import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovodrive_app/controllers/otpverification_controller.dart';
import 'package:ovodrive_app/views/dashboardscreenview.dart';

class Otpverificationscreenview extends StatefulWidget {
  const Otpverificationscreenview({super.key});

  @override
  State<Otpverificationscreenview> createState() =>
      _OtpverificationscreenviewState();
}

class _OtpverificationscreenviewState extends State<Otpverificationscreenview> {
  final OtpverificationController otpController = Get.put(
    OtpverificationController(),
  );
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          // Top image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.45,
              width: screenWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/jeep_image.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // OTP Verification Form
          Positioned(
            top: screenHeight * 0.42,
            left: 24,
            right: 24,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '4 digit OTP has been sent to your mobile number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 50,
                        child: TextField(
                          controller: otpController.otpcontroller[index],
                          focusNode: otpController.optFocusNode[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          onChanged:
                              (value) => otpController.onChanged(value, index),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 20),
                  // Timer Code
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.5,
                      child: Obx(
                        () => Center(
                          child: Text(
                            otpController.time.value,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.05,
                          //width: screenWidth * 0.5,
                          child: Text(
                            'Didn\'t receive the code?',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        SizedBox(width: 5),

                        SizedBox(
                          height: screenHeight * 0.05,
                          //width: screenWidth * 0.5,
                          child: Text(
                            'Resend',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  // Register button
                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              content: Row(
                                children: const [
                                  CircularProgressIndicator(),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      'Please wait...',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );

                        // Simulate API call delay
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.pop(context);
                          Get.to(Dashboardscreenview());
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
