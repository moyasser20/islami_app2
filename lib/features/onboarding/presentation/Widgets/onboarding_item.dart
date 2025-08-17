import 'package:flutter/material.dart';
import 'package:islami_app2/features/onboarding/models/on_boarding_model.dart';

import '../../../../core/theme/app_colors.dart';

class OnboardingItem extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  const OnboardingItem ({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          onBoardingModel.imgPath,
          height: size.height * 0.35,
        ),
        Text(
          onBoardingModel.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Janna',
            fontSize: 24,
            color: AppColors.primaryColor,
          ),
        ),

        Text(
          textAlign: TextAlign.center,
          onBoardingModel.description ?? "",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Janna',
            fontSize: 24,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
