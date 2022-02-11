import 'package:ecommerce/screens/presentations/delevery_status/delevery_status.dart';
import 'package:ecommerce/screens/presentations/login_page/login_info.dart';
import 'package:ecommerce/screens/presentations/login_page/login_name_page.dart';
import 'package:ecommerce/screens/presentations/main_home_page/home_page.dart';
import 'package:ecommerce/screens/presentations/payment_completed/payment_completed.dart';
import 'package:flutter/material.dart';

import '../../screens/presentations/about_product_page/about_product_page.dart';
import '../../screens/presentations/my_basket_page/my_basket_page.dart';
import '../../screens/presentations/starter_page/starter_page.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: ((context) => const StartPage()));
      case "/login_info":
        return MaterialPageRoute(builder: ((context) => const LoginInfo()));
      case "/login_name":
        return MaterialPageRoute(builder: ((context) => const LoginNamePage()));
      case "/start_page":
        return MaterialPageRoute(builder: ((context) => const MainHomePage()));
      case "/about_product":
        return MaterialPageRoute(
            builder: ((context) => const AboutProductPage()));
      case "/basket":
        return MaterialPageRoute(builder: ((context) => const MyBasketPage()));
      case "/completed":
        return MaterialPageRoute(
            builder: ((context) => const PaymentCompleted()));
      case "/delevery_status":
        return MaterialPageRoute(
            builder: ((context) => const DeleveryStatus()));
    }
    return null;
  } //
}
