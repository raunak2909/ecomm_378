import 'package:ecomm_378/ui/dashboard/dashboard_page.dart';
import 'package:ecomm_378/ui/login/login_screen.dart';
import 'package:ecomm_378/ui/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../ui/dashboard/dashboard_page.dart';
import '../../ui/sign_up/signup_screen.dart';
import '../../ui/splash/splash_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String splash = '/splash';
  static const String dashboard = '/dashboard';
  static const String productDetail = '/product_detail';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    signup: (context) => SignupScreen(),
    splash: (context) => SplashPage(),
    dashboard: (context) => DashboardPage(),
    productDetail: (context) => ProductDetailScreen(),
  };
}
