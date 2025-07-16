import 'package:flutter/material.dart';
import 'package:islami_app2/core/routes/app_routes_name.dart';
import 'package:islami_app2/features/layout/presentation/screens/layoutscreen.dart';
import 'package:islami_app2/features/splash/presentation/screens/splashScreen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => Splashscreen());

      case AppRoutes.layoutScreen:
        return MaterialPageRoute(builder: (_) => layoutScreen());
      default:
        return MaterialPageRoute(builder: (_) => Splashscreen());
    }
  }
}
