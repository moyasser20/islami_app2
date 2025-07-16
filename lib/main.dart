import 'package:flutter/material.dart';
import 'package:islami_app2/core/routes/app_routes_name.dart';
import 'package:islami_app2/core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.splashScreen,
    );
  }
}

