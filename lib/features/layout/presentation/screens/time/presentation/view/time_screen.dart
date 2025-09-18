import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/features/layout/presentation/screens/time/presentation/view/widgets/sala_widget.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../viewmodel/time_cubit.dart';
import '../viewmodel/time_states.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  DateTime _parseTime(String? time, DateTime now) {
    if (time == null || time.isEmpty) return now;
    final parts = time.split(':');
    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = int.tryParse(parts[1]) ?? 0;
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

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
        child: BlocConsumer<TimeCubit, TimeStates>(
          listener: (context, state) {
            if (state is TimeErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is TimeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else if (state is TimeSuccessState) {
              final now = DateTime.now();
              final formattedDate = DateFormat("dd MMM, \nyyyy").format(now);
              final dayName = DateFormat("EEEE").format(now);
              final timings = state.salahTimingsEntity;

              final prayers = {
                "Fajr": _parseTime(timings.fajr, now),
                "Dhuhr": _parseTime(timings.dhuhr, now),
                "Asr": _parseTime(timings.asr, now),
                "Maghrib": _parseTime(timings.maghrib, now),
                "Isha": _parseTime(timings.isha, now),
              };

              String nextPrayerName = "";
              Duration timeLeft = Duration.zero;

              for (var entry in prayers.entries) {
                if (entry.value.isAfter(now)) {
                  nextPrayerName = entry.key;
                  timeLeft = entry.value.difference(now);
                  break;
                }
              }

              if (nextPrayerName.isEmpty) {
                nextPrayerName = "Fajr";
                timeLeft =
                    prayers["Fajr"]!.add(const Duration(days: 1)).difference(now);
              }

              final hours = timeLeft.inHours;
              final minutes = timeLeft.inMinutes % 60;
              final timeLeftStr =
                  "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";

              return Column(
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      formattedDate,
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Janna",
                                      ),
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
                                            fontFamily: "Janna",
                                          ),
                                        ),
                                        Text(
                                          dayName,
                                          style: TextStyle(
                                            color: AppColors.secondaryColor
                                                .withOpacity(0.9),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Janna",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "09 Muh, \n1446",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Janna",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              CarouselSlider(
                                items: [
                                  SalaWidgetContainer(
                                    title: "Fajr",
                                    time: timings.fajr ?? "--:--",
                                    period: "AM",
                                  ),
                                  SalaWidgetContainer(
                                    title: "Dhuhr",
                                    time: timings.dhuhr ?? "--:--",
                                    period: "PM",
                                  ),
                                  SalaWidgetContainer(
                                    title: "Asr",
                                    time: timings.asr ?? "--:--",
                                    period: "PM",
                                  ),
                                  SalaWidgetContainer(
                                    title: "Maghrib",
                                    time: timings.maghrib ?? "--:--",
                                    period: "PM",
                                  ),
                                  SalaWidgetContainer(
                                    title: "Isha",
                                    time: timings.isha ?? "--:--",
                                    period: "PM",
                                  ),
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
                                    "Next Prayer: $nextPrayerName - $timeLeftStr",
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
                                  ),
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
                        child: Image.asset("assets/images/evening_azkar.png"),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        child: Image.asset("assets/images/evening_azkar.png"),
                      ),
                    ],
                  ).setHorizontalPadding(context, 0.025),
                ],
              );
            } else {
              return const Center(
                child: Text("No Data"),
              );
            }
          },
        ),
      ),
    );
  }
}
