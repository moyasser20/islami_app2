import 'package:flutter/material.dart';
import 'package:islami_app2/core/routes/app_routes_name.dart';
import 'package:islami_app2/features/layout/presentation/screens/layout_screen.dart';
import 'package:islami_app2/features/layout/presentation/screens/quran/quran_details_screen.dart';
import 'package:islami_app2/features/onboarding/presentation/screens/on_boarding_screen.dart';
import 'package:islami_app2/features/splash/presentation/screens/splashScreen.dart';

import '../../features/layout/models/surah_data_model.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => Splashscreen());

      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case AppRoutes.layoutScreen:
        return MaterialPageRoute(builder: (_) => LayoutScreen());
      case AppRoutes.quranDetailsScreen:
        var args = settings.arguments as Surah;
        return MaterialPageRoute(builder: (_)=> QuranDetailsScreen(suraData:args ,));
      default:
        return MaterialPageRoute(builder: (_) => Splashscreen());
    }
  }
}
