import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app2/core/constants/app_assets.dart';
import 'package:islami_app2/core/routes/app_routes_name.dart';
import 'package:islami_app2/core/routes/routes.dart';

class Splashscreen extends StatefulWidget {
  static final Duration _duration = Duration(

    milliseconds: 1750
  );
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3300) ,(){
      Navigator.pushReplacementNamed(context, AppRoutes.onBoardingScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppAssets.splashBg),
        ),
      ),
      child: Stack(
        children: [
          FadeInDown
            (
            duration: Splashscreen._duration,
            child: Align(
              alignment: Alignment.topRight,
                child: Image.asset(AppAssets.splashRight)),
          ),
          FadeInLeft(
            duration: Splashscreen._duration,
            child: Container(
              margin: EdgeInsets.only(bottom: size.height *0.35),
              child: Align(
                alignment: Alignment.centerLeft,
                  child: Image.asset(AppAssets.splashLeft)),
            ),
          ),
          FadeInRight(
            duration: Splashscreen._duration,
            child: Container(
              margin: EdgeInsets.only(top: size.height*0.45),
              child: Align(
                alignment: Alignment.centerRight,
                  child: Image.asset(AppAssets.splashUnderRight, width: size.width*0.25,)),
            ),
          ),
          ZoomIn(
            duration: Splashscreen._duration,
            delay: Duration(seconds: 2),
            child: Align(
              alignment: Alignment.center,
                child: Image.asset(AppAssets.splashMiddle)),
          ),
          FadeIn(
            duration: Splashscreen._duration,

            child: Container(
              margin: EdgeInsets.only(top: size.height *0.065),
              child: Align(
                alignment: Alignment.topCenter,
                  child: Image.asset(AppAssets.splashUpper)),
            ),
          ),
        ],
      ),
    );
  }
}
