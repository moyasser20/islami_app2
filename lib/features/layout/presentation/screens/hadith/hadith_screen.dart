import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/features/layout/models/hadith_data.dart';
import 'package:islami_app2/features/layout/presentation/screens/hadith/widgets/hadith_item_card.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../models/surah_data_model.dart';

class HadithScreen extends StatefulWidget {
  HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  final List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    loadHadithData();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.hadithTabBg), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/islami_image.png")
              .setHorizontalAndVerticalPadding(context, 0.13, 0.025),
          CarouselSlider(
              items: hadithDataList.map((e) {
                return HadithItemCard(
                  hadithData: e,
                );
              }).toList(),
              options: CarouselOptions(
                height: 580,
                aspectRatio: 0.8,
                viewportFraction: 0.7,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.28,
                scrollDirection: Axis.horizontal,
              ))
        ],
      ),
    );
  }

  loadHadithData() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadith = content.split("#");

    for (var element in allHadith) {
      String singleHadith = element.trim();
      int index = singleHadith.indexOf("\n");
      String hadithTitle = singleHadith.substring(0, index);
      String hadithContent = singleHadith.substring(index + 1);

      var hadithData =
          HadithData(hadithTitle: hadithTitle, hadithContent: hadithContent);

      hadithDataList.add(hadithData);

      setState(() {});
    }
  }
}
