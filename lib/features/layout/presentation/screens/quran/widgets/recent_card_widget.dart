import 'package:flutter/material.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/core/theme/app_colors.dart';

import '../../../../models/most_recently_model.dart';

class RecentCardWidget extends StatelessWidget {
  final MostRecentlyQuranModel mostRecentlyQuranModel;
  const RecentCardWidget({super.key, required this.mostRecentlyQuranModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
     // width: 285,
      //height: 150,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(mostRecentlyQuranModel.suraNameEn, style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Janna",
                color: AppColors.secondaryColor
              ),),
              Text(mostRecentlyQuranModel.suraNameAr, style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Janna",
                color: AppColors.secondaryColor
              ),),
              Text(mostRecentlyQuranModel.verses, style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: "Janna",
                color: AppColors.secondaryColor
              ),),
            ],
          ),
          Image.asset("assets/images/quran_container_photo.png")
        ],
      ),
    ).setHorizontalPadding(context, 0.02);
  }
}
