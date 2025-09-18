import 'package:flutter/material.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/core/theme/app_colors.dart';

import '../../../../../core/constants/app_assets.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<String> tasbeh = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];
  int currentIndex = 0;

  int counter = 0;
  double angle = 0.0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.SebhaTabBg), fit: BoxFit.fill),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/islami_image.png",
                height: size.height * 0.15,
              ).setHorizontalPadding(context, 0.08),
              const SizedBox(height: 15),
              Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Janna",
                  color: AppColors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: _onSebhaTap,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: size.width * 0.438),
                      child: Image.asset(
                        "assets/images/sebha_header.png",
                        height: size.height * 0.10,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: size.height * 0.084),
                            child: Transform.rotate(
                              angle: angle,
                              child: Image.asset(
                                "assets/images/Sebha_body.png",
                                width: size.width * 030,
                                height: size.height * 0.42,
                                fit: BoxFit.fill,
                              ),
                            )),
                        Column(
                          children: [
                            Text(
                              tasbeh[currentIndex],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Janna"),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              counter.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Janna"),
                            ),

                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _onSebhaTap(){
    counter++;
    angle -= 10.0;
    if(counter == 33){
      counter = 0;
      currentIndex++;
      if(currentIndex == 3){
        currentIndex = 0;
      }
    }
    setState(() {

    });
  }
}
