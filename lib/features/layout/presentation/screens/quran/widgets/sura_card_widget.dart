import 'package:flutter/material.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/core/theme/app_colors.dart';
import 'package:islami_app2/features/layout/models/surah_data_model.dart';

class SuraCardWidget extends StatelessWidget {

  final Surah surahModel;

  const SuraCardWidget({
    super.key, required this.surahModel,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/icons/sura_list_icon_number.png",
              color: AppColors.white,
              height: 55,
              width: 55,
            ),
            Text(
              surahModel.suraId.toString(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: "Janna",
              ),
            ),
          ],
        ),
        const SizedBox(width: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              surahModel.nameEnglish,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: "Janna",
              ),
            ),
            SizedBox(height: 7),
            Text(
              "${surahModel.versesCount} Verses",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: "Janna",
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          surahModel.nameArabic,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
            fontFamily: "Janna",
          ),
        ),
      ],
    ).setHorizontalPadding(context, 0.05);
  }
}
