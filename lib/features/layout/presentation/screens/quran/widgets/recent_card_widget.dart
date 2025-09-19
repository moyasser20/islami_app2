import 'package:flutter/material.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/core/theme/app_colors.dart';
import 'package:islami_app2/features/layout/models/surah_data_model.dart';

class RecentCardWidget extends StatelessWidget {
  final Surah mostRecentlyQuranModel;
  const RecentCardWidget({super.key, required this.mostRecentlyQuranModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mostRecentlyQuranModel.nameArabic,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Janna",
                    color: AppColors.secondaryColor,
                  ),
                ),
                Text(
                  mostRecentlyQuranModel.nameEnglish,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Janna",
                    color: AppColors.secondaryColor,
                  ),
                ),
                Text(
                  "${mostRecentlyQuranModel.versesCount} verses",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Janna",
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Image.asset("assets/images/quran_container_photo.png"),
        ],
      ),
    ).setHorizontalPadding(context, 0.02);
  }
}
