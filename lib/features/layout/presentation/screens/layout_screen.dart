import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islami_app2/core/constants/app_assets.dart';
import 'package:islami_app2/core/di/di.dart';
import 'package:islami_app2/core/theme/app_colors.dart';
import 'package:islami_app2/features/layout/presentation/screens/hadith/hadith_screen.dart';
import 'package:islami_app2/features/layout/presentation/screens/quran/quranscreen.dart';
import 'package:islami_app2/features/layout/presentation/screens/radio/presentation/viewmodel/radio_cubit.dart';
import 'package:islami_app2/features/layout/presentation/screens/sebha/sebhaScreen.dart';
import 'package:islami_app2/features/layout/presentation/screens/time/presentation/viewmodel/time_cubit.dart';

import '../widgets/custome_nav_bar_item.dart';
import 'radio/presentation/view/RadioScreen.dart';
import 'time/presentation/view/time_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;

  String getTodayDateString() {
    final now = DateTime.now();
    return DateFormat('dd-MM-yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    final todayDate = getTodayDateString();

    final List<Widget> tabs = [
      QuranScreen(),
      HadithScreen(),
      SebhaScreen(),
      BlocProvider(
        create: (_) => getIt<RadioCubit>()..getRadioData(),
        child: const RadioScreen(),
      ),
      BlocProvider(
        create: (_) => getIt<TimeCubit>()
          ..getPrayerTimes(
            date: todayDate,
            city: "Cairo",
            country: "Egypt",
          ),
        child: const TimeScreen(),
      ),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: "Quran",
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItem: 0,
              IconPath: AppAssets.quranIcn,
            ),
          ),
          BottomNavigationBarItem(
            label: "Hadith",
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItem: 1,
              IconPath: AppAssets.hadithIcn,
            ),
          ),
          BottomNavigationBarItem(
            label: "Sebha",
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItem: 2,
              IconPath: AppAssets.sebhaIcn,
            ),
          ),
          BottomNavigationBarItem(
            label: "Radio",
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItem: 3,
              IconPath: AppAssets.radioIcn,
            ),
          ),
          BottomNavigationBarItem(
            label: "Time",
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItem: 4,
              IconPath: AppAssets.timeIcn,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: tabs,
      ),
    );
  }
}
