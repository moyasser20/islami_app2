import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.RadioTabBg),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
