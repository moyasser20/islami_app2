import 'package:flutter/material.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/core/routes/app_routes_name.dart';
import 'package:islami_app2/core/routes/routes.dart';
import 'package:islami_app2/core/theme/app_colors.dart';
import 'package:islami_app2/features/onboarding/models/on_boarding_model.dart';
import 'package:islami_app2/features/onboarding/presentation/Widgets/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  var controller = PageController();
  var activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/islami_icon.png",
              height: size.height * 0.20,
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  activeIndex = index;
                  setState(() {

                  });
                },
                itemCount: OnBoardingModel.onboardingList.length,
                itemBuilder: (context, index) {
                  var onboardingList = OnBoardingModel.onboardingList[index];

                  return OnboardingItem(onBoardingModel: onboardingList);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: activeIndex!= 0,
                  replacement: Spacer(),
                  child: TextButton(
                    onPressed: () {
                      controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                      if(activeIndex > 0)
                        activeIndex --;

                      },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontFamily: "Janna",
                        fontSize: 18,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: OnBoardingModel.onboardingList.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primaryColor,
                    dotColor: AppColors.silver,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    if(activeIndex <  OnBoardingModel.onboardingList.length - 1)
                      activeIndex++;

                    if(activeIndex == OnBoardingModel.onboardingList.length - 1)
                      Navigator.pushReplacementNamed(context, AppRoutes.layoutScreen);
                  },
                  child: Text(
                    activeIndex == OnBoardingModel.onboardingList.length - 1 ?"Finish": "Next",
                    style: TextStyle(
                      fontFamily: "Janna",
                      fontSize: 18,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ).setHorizontalPadding(context, 0.025),
      ),
    );
  }
}
