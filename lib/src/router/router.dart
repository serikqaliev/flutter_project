import 'package:flutter/cupertino.dart';
import 'package:lesson_1/src/screens/home/home_screen.dart';
import './router_const.dart';
import '../screens/registration/registration_screen.dart';
import '../screens/auth/auth_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case RegistrationRoute:
        return CupertinoPageRoute(
          builder: (context) => const RegistrationScreen(),
        );
      case HomeRoute:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => const AuthScreen(),
        );
    }
  }
}
