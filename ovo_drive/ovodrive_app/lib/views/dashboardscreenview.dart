import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovodrive_app/controllers/ride_controller.dart';
import 'package:ovodrive_app/widgets/cust_find_ride_page.dart';
import 'package:ovodrive_app/widgets/cust_offer_ride.dart';

class Dashboardscreenview extends StatefulWidget {
  const Dashboardscreenview({super.key});

  @override
  State<Dashboardscreenview> createState() => _DashboardscreenviewState();
}

RideController ride_controller = Get.put(RideController());

class _DashboardscreenviewState extends State<Dashboardscreenview> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Blue Header
          Container(
            color: Colors.blue,
            width: double.infinity,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 12,
              left: 16,
              right: 16,
              bottom: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 28),
                    Text(
                      'QUICK POOL',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 5.0,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 28,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Tabs Row
                Row(
                  children: [
                    // First Tab Button (Find Ride)
                    Expanded(
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: () {
                            ride_controller.selectedIndex.value = 0;
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Find Ride',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color:
                                  ride_controller.selectedIndex.value == 0
                                      ? Colors.blue
                                      : Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    // Second Tab Button (Offer Ride)
                    Expanded(
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: () {
                            ride_controller.selectedIndex.value = 1;
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Offer ride',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color:
                                  ride_controller.selectedIndex.value == 1
                                      ? Colors.blue
                                      : Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

     
          Expanded(
            child: Obx(() {
              if (ride_controller.selectedIndex.value == 0) {
                return CustFindRidePage();
              } else {
                return CustOfferRide();
              }
            }),
          ),
        ],
      ),
    );
  }
}
