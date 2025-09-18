import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/theme/app_colors.dart';
import 'widgets/sala_widget.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.TimeTabBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5),
            Image.asset(
              "assets/images/islami_image.png",
              height: size.height * 0.15,
            ).setHorizontalPadding(context, 0.15),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/images/time_container1.png"),
                  Image.asset("assets/images/time_container2.png"),
                  ClipRect(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "16 Jul, \n2024",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Janna"),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Pray Time",
                                    style: TextStyle(
                                        color: AppColors.secondaryColor
                                            .withOpacity(0.7),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Janna"),
                                  ),
                                  Text(
                                    "Tuesday",
                                    style: TextStyle(
                                        color: AppColors.secondaryColor
                                            .withOpacity(0.9),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Janna"),
                                  ),
                                ],
                              ),
                              Text(
                                "09 Muh, \n1446",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Janna"),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        CarouselSlider(
                          items: const [
                            SalaWidgetContainer(
                                title: "Fajr", time: "04:04", period: "AM"),
                            SalaWidgetContainer(
                                title: "Dhuhr", time: "01:01", period: "PM"),
                            SalaWidgetContainer(
                                title: "Asr", time: "04:38", period: "PM"),
                            SalaWidgetContainer(
                                title: "Maghrib", time: "07:57", period: "PM"),
                            SalaWidgetContainer(
                                title: "Isha", time: "09:15", period: "PM"),
                          ],
                          options: CarouselOptions(
                            height: 140,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.22,
                            viewportFraction: 0.28,
                            enableInfiniteScroll: true,
                            autoPlay: false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Next Pray - 02:32",
                              style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Janna",
                              ),
                            ),
                            const SizedBox(width: 30),
                            const Icon(
                              Icons.volume_off,
                              size: 30,
                              color: Colors.black,
                            )
                          ],
                        ).setOnlyPadding(context, 0, 0.025, 0, 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Azkar",
              style: TextStyle(
                color: AppColors.titleTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Janna",
              ),
            ).setHorizontalPadding(context, 0.035),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    child: Image.asset("assets/images/evening_azkar.png")),
                const SizedBox(width: 20),
                GestureDetector(
                    child: Image.asset("assets/images/evening_azkar.png")),
              ],
            ).setHorizontalPadding(context, 0.025)
          ],
        ),
      ),
    );
  }
}
