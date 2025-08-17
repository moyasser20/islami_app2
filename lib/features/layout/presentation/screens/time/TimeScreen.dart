import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.TimeTabBg),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
