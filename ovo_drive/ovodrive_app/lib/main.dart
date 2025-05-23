import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ovodrive_app/views/dashboardscreenview.dart';
import 'package:ovodrive_app/views/loginscreenview.dart';
import 'package:ovodrive_app/views/otpverificationscreenview.dart';
import 'package:ovodrive_app/views/registerscreenview.dart';
import 'package:ovodrive_app/views/slider_page_view.dart';
import 'package:ovodrive_app/views/splash_screen_view.dart';
import 'package:ovodrive_app/widgets/cust_find_ride_page.dart';
import 'package:ovodrive_app/widgets/cust_map_page.dart';
import 'package:ovodrive_app/widgets/cust_offer_ride.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (BuildContext context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreenView',
      getPages: [
        GetPage(
          name: '/SplashScreenView',
          page: () => const SplashScreenView(),
        ),
        GetPage(name: '/SliderPageView', page: () => const SliderPageView()),
        GetPage(name: '/Loginscreenview', page: () => const Loginscreenview()),
        GetPage(
          name: '/Registerscreenview',
          page: () => const Registerscreenview(),
        ),
        GetPage(
          name: '/Otpverificationscreenview',
          page: () => const Otpverificationscreenview(),
        ),
        GetPage(
          name: '/Dashboardscreenview',
          page: () => Dashboardscreenview(),
        ),
        GetPage(name: '/CustFindRidePage', page: () => CustFindRidePage()),
        GetPage(name: '/CustOfferRide', page: () => CustOfferRide()),
        GetPage(name: '/CustMapPage', page: () => CustMapPage()),
      ],
    );
  }
}
