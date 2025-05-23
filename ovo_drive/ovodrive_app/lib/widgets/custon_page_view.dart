import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovodrive_app/controllers/pages_controller.dart';
import 'package:ovodrive_app/views/loginscreenview.dart';
import 'package:ovodrive_app/widgets/custom_pages.dart';

class CustomPageView extends StatelessWidget {
  final PageControllerGetX pageController = Get.put(PageControllerGetX());

  final List<Widget> pages = [FirstPage(), SecondPage(), ThirdPage()];

  CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController.pageController,
                onPageChanged: (index) {
                  pageController.currentPage.value = index;
                },
                children: pages,
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pages.length,
                        (index) => GestureDetector(
                          onTap: () => pageController.changePage(index),
                          child: Container(
                            margin: const EdgeInsets.all(6),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  pageController.currentPage.value == index
                                      ? Colors.blue
                                      : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        int currentIndex = pageController.currentPage.value;
                        if (currentIndex < pages.length - 1) {
                          pageController.changePage(currentIndex + 1);
                        } else {
                          Get.to(Loginscreenview());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(160, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        pageController.currentPage.value == pages.length - 1
                            ? "Login"
                            : "Next",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
