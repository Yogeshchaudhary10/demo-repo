import 'package:flutter/material.dart';
import 'package:text202/presentation/presentation/status_full.dart';
import 'package:text202/presentation/presentation/stauts.dart';
import 'package:text202/presentation/resources/sign_up/sign_up_screen.dart';
import 'package:text202/presentation/resources/strings_manager.dart';
import 'package:text202/presentation/sign_in/sign_in_screen.dart';

import 'home_page/home_page.dart';

// import 'package:text202/presentation/cart/cart_screen.dart';
// import 'package:pasal/presentation/complete_profile/complete_profile_screen.dart';
// import 'package:pasal/presentation/details/details_screen.dart';
// import 'package:pasal/presentation/home/home_screen.dart';
// import 'package:pasal/presentation/login_success/login_success_screen.dart';
// import 'package:pasal/presentation/profile/profile_screen.dart';
// import 'package:pasal/presentation/resources/strings_manager.dart';

class Routes {
  static const String initialScreenRoute = "/";
  static const String signIn = "/signIn";
  static const String signup = "/signUp";
  static const String completeProfileScreen = "/completeProfileScreen";
  static const String loginSuccessScreen = "/loginSuccessScreen";
  static const String home = "/home";
  static const String detailScreen = "/detailScreen";
  static const String profileScreen = "/profileScreen";
  static const String cart = "/cart";
  static const String status = "/status";
  static const String statusFull = "/statusFull";
}

class RouteGenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      // case Routes.initialScreenRoute:
      //   return MaterialPageRoute(builder: (_) => const SignInBody ());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignFormClass());

      case Routes.status:
        return MaterialPageRoute(builder: (_) => const Status());

      case Routes.statusFull:
        return MaterialPageRoute(builder: (_) => const StatusFull());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppString.noRouteFound),
              ),
              body: const Center(child: Text(AppString.noRouteFound)),
            ));
  }
}
