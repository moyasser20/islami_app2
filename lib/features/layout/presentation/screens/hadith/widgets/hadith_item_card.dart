import 'package:flutter/material.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/features/layout/models/hadith_data.dart';

class HadithItemCard extends StatelessWidget {
  final HadithData hadithData;
  const HadithItemCard({super.key, required this.hadithData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage("assets/images/hadith_card_img.png"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 25),
          Text(
            hadithData.hadithTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Janna",
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Text(hadithData.hadithContent,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Janna",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ).setHorizontalPadding(context, 0.015),

              ],
            ),
          )
        ],
      ),
    );
  }
}
