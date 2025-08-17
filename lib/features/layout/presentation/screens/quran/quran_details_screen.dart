import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/core/theme/app_colors.dart';
import 'package:islami_app2/features/layout/models/surah_data_model.dart';

class QuranDetailsScreen extends StatefulWidget {
  final Surah suraData;

  QuranDetailsScreen({super.key, required this.suraData});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> versesList = [];

  @override
  void initState() {
    super.initState();
    loadData(widget.suraData.suraId.toString());
  }

  Future<void> loadData(String surahId) async {
    try {
      String content =
      await rootBundle.loadString("assets/files/$surahId.txt");
      setState(() {
        versesList = content.split("\n");
      });
    } catch (e) {
      debugPrint("❌ Error loading surah $surahId: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Soura_Details_Screen.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          title: Text(
            widget.suraData.nameEnglish,
            style: TextStyle(
              fontFamily: "Janna",
              fontWeight: FontWeight.bold,
              fontSize: 21,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: versesList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.suraData.nameArabic,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Janna",
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: AppColors.primaryColor,
                ),
              ).setOnlyPadding(context, 0.02, 0, 0, 0),
              const SizedBox(height: 16),
              ...List.generate(
                versesList.length,
                    (index) => Text(
                  "${versesList[index]} [${index + 1}]",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Janna",
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: AppColors.primaryColor,
                  ),
                ).setOnlyPadding(context, 0.02, 0, 0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
