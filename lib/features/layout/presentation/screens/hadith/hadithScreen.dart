import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';

class hadithScreen extends StatelessWidget {
  const hadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.hadithTabBg),
            fit:BoxFit.fill
        ),
      ),
    );
  }
}
