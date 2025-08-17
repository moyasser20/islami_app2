import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';

class sebhScreen extends StatelessWidget {
  const sebhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.SebhaTabBg),
            fit:BoxFit.fill

        ),
      ),
    );
  }
}
