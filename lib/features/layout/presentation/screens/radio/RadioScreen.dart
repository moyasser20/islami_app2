import 'package:flutter/material.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/core/theme/app_colors.dart';
import 'package:islami_app2/features/layout/presentation/screens/radio/widgets/custome_tab_button.dart';
import '../../../../../core/constants/app_assets.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.RadioTabBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            Image.asset(
              "assets/images/islami_image.png",
              height: size.height * 0.15,
            ).setHorizontalPadding(context, 0.15),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTabButton(
                  title: "Radio",
                  isSelected: selectedRadio == 0,
                  onTap: () {
                    setState(() {
                      selectedRadio = 0;
                    });
                  },
                  selectedColor: AppColors.primaryColor,
                  unselectedColor: AppColors.secondaryColor.withOpacity(0.7),
                ),
                CustomTabButton(
                  title: "Reciters",
                  isSelected: selectedRadio == 1,
                  onTap: () {
                    setState(() {
                      selectedRadio = 1;
                    });
                  },
                  selectedColor: AppColors.primaryColor,
                  unselectedColor: AppColors.secondaryColor.withOpacity(0.7),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
