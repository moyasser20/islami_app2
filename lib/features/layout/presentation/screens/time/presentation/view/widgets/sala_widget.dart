import 'package:flutter/material.dart';

import '../../../../../../../../core/theme/app_colors.dart';

class SalaWidgetContainer extends StatelessWidget {
  final String title;
  final String time;
  final String period;

  const SalaWidgetContainer({
    super.key,
    required this.title,
    required this.time,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            AppColors.secondaryColor,
            AppColors.primaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Janna")),
          Text(time,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Janna")),
          Text(period,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Janna")),
        ],
      ),
    );
  }
}
