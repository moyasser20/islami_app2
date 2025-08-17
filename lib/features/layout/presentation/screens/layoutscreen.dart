import 'package:flutter/material.dart';
import 'package:islami_app2/core/constants/app_assets.dart';
import 'package:islami_app2/core/theme/app_colors.dart';
import 'package:islami_app2/features/layout/presentation/screens/hadith/hadithScreen.dart';
import 'package:islami_app2/features/layout/presentation/screens/quran/quranscreen.dart';
import 'package:islami_app2/features/layout/presentation/screens/sebha/sebhaScreen.dart';

import '../widgets/custome_nav_bar_item.dart';
import 'radio/RadioScreen.dart';
import 'time/TimeScreen.dart';

class layoutScreen extends StatefulWidget {
  const layoutScreen({super.key});

  @override
  State<layoutScreen> createState() => _layoutScreenState();
}

class _layoutScreenState extends State<layoutScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    quranScreen(),
    hadithScreen(),
    sebhScreen(),
    RadioScreen(),
    TimeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
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
            icon:CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItem: 2,
              IconPath: AppAssets.sebhaIcn,
            ),
          ),
          BottomNavigationBarItem(
            label: "Radio",
            icon:CustomNavBarItem(
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
      body: tabs[selectedIndex],
    );
  }
}
