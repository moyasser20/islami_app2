import 'package:flutter/material.dart';
import 'package:islami_app2/core/constants/app_assets.dart';
import 'package:islami_app2/core/constants/local_storage_keys.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/core/routes/app_routes_name.dart';
import 'package:islami_app2/core/storage/local_storage_service.dart';
import 'package:islami_app2/core/theme/app_colors.dart';
import 'package:islami_app2/features/layout/models/most_recently_model.dart';

import '../../../models/surah_data_model.dart';
import 'widgets/recent_card_widget.dart';
import 'widgets/sura_card_widget.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  void initState() {
    super.initState();
    _loadRecentSurah();
  }

  List<Surah> recentDataList = [];

  List<String> recentSurahIndexList = [];

  final List<Surah> quranSurahs = [
    Surah(
        suraId: 1,
        nameArabic: "الفاتحة",
        nameEnglish: "Al-Fatiha",
        versesCount: 7),
    Surah(
        suraId: 2,
        nameArabic: "البقرة",
        nameEnglish: "Al-Baqarah",
        versesCount: 286),
    Surah(
        suraId: 3,
        nameArabic: "آل عمران",
        nameEnglish: "Aal-E-Imran",
        versesCount: 200),
    Surah(
        suraId: 4,
        nameArabic: "النساء",
        nameEnglish: "An-Nisa",
        versesCount: 176),
    Surah(
        suraId: 5,
        nameArabic: "المائدة",
        nameEnglish: "Al-Maidah",
        versesCount: 120),
    Surah(
        suraId: 6,
        nameArabic: "الأنعام",
        nameEnglish: "Al-An'am",
        versesCount: 165),
    Surah(
        suraId: 7,
        nameArabic: "الأعراف",
        nameEnglish: "Al-A'raf",
        versesCount: 206),
    Surah(
        suraId: 8,
        nameArabic: "الأنفال",
        nameEnglish: "Al-Anfal",
        versesCount: 75),
    Surah(
        suraId: 9,
        nameArabic: "التوبة",
        nameEnglish: "At-Tawbah",
        versesCount: 129),
    Surah(
        suraId: 10, nameArabic: "يونس", nameEnglish: "Yunus", versesCount: 109),
    Surah(suraId: 11, nameArabic: "هود", nameEnglish: "Hud", versesCount: 123),
    Surah(
        suraId: 12, nameArabic: "يوسف", nameEnglish: "Yusuf", versesCount: 111),
    Surah(
        suraId: 13,
        nameArabic: "الرعد",
        nameEnglish: "Ar-Ra'd",
        versesCount: 43),
    Surah(
        suraId: 14,
        nameArabic: "إبراهيم",
        nameEnglish: "Ibrahim",
        versesCount: 52),
    Surah(
        suraId: 15,
        nameArabic: "الحجر",
        nameEnglish: "Al-Hijr",
        versesCount: 99),
    Surah(
        suraId: 16,
        nameArabic: "النحل",
        nameEnglish: "An-Nahl",
        versesCount: 128),
    Surah(
        suraId: 17,
        nameArabic: "الإسراء",
        nameEnglish: "Al-Isra",
        versesCount: 111),
    Surah(
        suraId: 18,
        nameArabic: "الكهف",
        nameEnglish: "Al-Kahf",
        versesCount: 110),
    Surah(
        suraId: 19, nameArabic: "مريم", nameEnglish: "Maryam", versesCount: 98),
    Surah(suraId: 20, nameArabic: "طه", nameEnglish: "Ta-Ha", versesCount: 135),
    Surah(
        suraId: 21,
        nameArabic: "الأنبياء",
        nameEnglish: "Al-Anbiya",
        versesCount: 112),
    Surah(
        suraId: 22,
        nameArabic: "الحج",
        nameEnglish: "Al-Hajj",
        versesCount: 78),
    Surah(
        suraId: 23,
        nameArabic: "المؤمنون",
        nameEnglish: "Al-Mu'minun",
        versesCount: 118),
    Surah(
        suraId: 24,
        nameArabic: "النور",
        nameEnglish: "An-Nur",
        versesCount: 64),
    Surah(
        suraId: 25,
        nameArabic: "الفرقان",
        nameEnglish: "Al-Furqan",
        versesCount: 77),
    Surah(
        suraId: 26,
        nameArabic: "الشعراء",
        nameEnglish: "Ash-Shu'ara",
        versesCount: 227),
    Surah(
        suraId: 27,
        nameArabic: "النمل",
        nameEnglish: "An-Naml",
        versesCount: 93),
    Surah(
        suraId: 28,
        nameArabic: "القصص",
        nameEnglish: "Al-Qasas",
        versesCount: 88),
    Surah(
        suraId: 29,
        nameArabic: "العنكبوت",
        nameEnglish: "Al-Ankabut",
        versesCount: 69),
    Surah(
        suraId: 30,
        nameArabic: "الروم",
        nameEnglish: "Ar-Rum",
        versesCount: 60),
    Surah(
        suraId: 31,
        nameArabic: "لقمان",
        nameEnglish: "Luqman",
        versesCount: 34),
    Surah(
        suraId: 32,
        nameArabic: "السجدة",
        nameEnglish: "As-Sajda",
        versesCount: 30),
    Surah(
        suraId: 33,
        nameArabic: "الأحزاب",
        nameEnglish: "Al-Ahzab",
        versesCount: 73),
    Surah(suraId: 34, nameArabic: "سبأ", nameEnglish: "Saba", versesCount: 54),
    Surah(
        suraId: 35, nameArabic: "فاطر", nameEnglish: "Fatir", versesCount: 45),
    Surah(suraId: 36, nameArabic: "يس", nameEnglish: "Ya-Sin", versesCount: 83),
    Surah(
        suraId: 37,
        nameArabic: "الصافات",
        nameEnglish: "As-Saffat",
        versesCount: 182),
    Surah(suraId: 38, nameArabic: "ص", nameEnglish: "Sad", versesCount: 88),
    Surah(
        suraId: 39,
        nameArabic: "الزمر",
        nameEnglish: "Az-Zumar",
        versesCount: 75),
    Surah(
        suraId: 40, nameArabic: "غافر", nameEnglish: "Ghafir", versesCount: 85),
    Surah(
        suraId: 41,
        nameArabic: "فصلت",
        nameEnglish: "Fussilat",
        versesCount: 54),
    Surah(
        suraId: 42,
        nameArabic: "الشورى",
        nameEnglish: "Ash-Shura",
        versesCount: 53),
    Surah(
        suraId: 43,
        nameArabic: "الزخرف",
        nameEnglish: "Az-Zukhruf",
        versesCount: 89),
    Surah(
        suraId: 44,
        nameArabic: "الدخان",
        nameEnglish: "Ad-Dukhan",
        versesCount: 59),
    Surah(
        suraId: 45,
        nameArabic: "الجاثية",
        nameEnglish: "Al-Jathiyah",
        versesCount: 37),
    Surah(
        suraId: 46,
        nameArabic: "الأحقاف",
        nameEnglish: "Al-Ahqaf",
        versesCount: 35),
    Surah(
        suraId: 47,
        nameArabic: "محمد",
        nameEnglish: "Muhammad",
        versesCount: 38),
    Surah(
        suraId: 48,
        nameArabic: "الفتح",
        nameEnglish: "Al-Fath",
        versesCount: 29),
    Surah(
        suraId: 49,
        nameArabic: "الحجرات",
        nameEnglish: "Al-Hujurat",
        versesCount: 18),
    Surah(suraId: 50, nameArabic: "ق", nameEnglish: "Qaf", versesCount: 45),
    Surah(
        suraId: 51,
        nameArabic: "الذاريات",
        nameEnglish: "Adh-Dhariyat",
        versesCount: 60),
    Surah(
        suraId: 52,
        nameArabic: "الطور",
        nameEnglish: "At-Tur",
        versesCount: 49),
    Surah(
        suraId: 53,
        nameArabic: "النجم",
        nameEnglish: "An-Najm",
        versesCount: 62),
    Surah(
        suraId: 54,
        nameArabic: "القمر",
        nameEnglish: "Al-Qamar",
        versesCount: 55),
    Surah(
        suraId: 55,
        nameArabic: "الرحمن",
        nameEnglish: "Ar-Rahman",
        versesCount: 78),
    Surah(
        suraId: 56,
        nameArabic: "الواقعة",
        nameEnglish: "Al-Waqi'a",
        versesCount: 96),
    Surah(
        suraId: 57,
        nameArabic: "الحديد",
        nameEnglish: "Al-Hadid",
        versesCount: 29),
    Surah(
        suraId: 58,
        nameArabic: "المجادلة",
        nameEnglish: "Al-Mujadila",
        versesCount: 22),
    Surah(
        suraId: 59,
        nameArabic: "الحشر",
        nameEnglish: "Al-Hashr",
        versesCount: 24),
    Surah(
        suraId: 60,
        nameArabic: "الممتحنة",
        nameEnglish: "Al-Mumtahina",
        versesCount: 13),
    Surah(
        suraId: 61,
        nameArabic: "الصف",
        nameEnglish: "As-Saff",
        versesCount: 14),
    Surah(
        suraId: 62,
        nameArabic: "الجمعة",
        nameEnglish: "Al-Jumu'a",
        versesCount: 11),
    Surah(
        suraId: 63,
        nameArabic: "المنافقون",
        nameEnglish: "Al-Munafiqun",
        versesCount: 11),
    Surah(
        suraId: 64,
        nameArabic: "التغابن",
        nameEnglish: "At-Taghabun",
        versesCount: 18),
    Surah(
        suraId: 65,
        nameArabic: "الطلاق",
        nameEnglish: "At-Talaq",
        versesCount: 12),
    Surah(
        suraId: 66,
        nameArabic: "التحريم",
        nameEnglish: "At-Tahrim",
        versesCount: 12),
    Surah(
        suraId: 67,
        nameArabic: "الملك",
        nameEnglish: "Al-Mulk",
        versesCount: 30),
    Surah(
        suraId: 68,
        nameArabic: "القلم",
        nameEnglish: "Al-Qalam",
        versesCount: 52),
    Surah(
        suraId: 69,
        nameArabic: "الحاقة",
        nameEnglish: "Al-Haqqah",
        versesCount: 52),
    Surah(
        suraId: 70,
        nameArabic: "المعارج",
        nameEnglish: "Al-Ma'arij",
        versesCount: 44),
    Surah(suraId: 71, nameArabic: "نوح", nameEnglish: "Nuh", versesCount: 28),
    Surah(
        suraId: 72,
        nameArabic: "الجن",
        nameEnglish: "Al-Jinn",
        versesCount: 28),
    Surah(
        suraId: 73,
        nameArabic: "المزمل",
        nameEnglish: "Al-Muzzammil",
        versesCount: 20),
    Surah(
        suraId: 74,
        nameArabic: "المدثر",
        nameEnglish: "Al-Muddaththir",
        versesCount: 56),
    Surah(
        suraId: 75,
        nameArabic: "القيامة",
        nameEnglish: "Al-Qiyama",
        versesCount: 40),
    Surah(
        suraId: 76,
        nameArabic: "الإنسان",
        nameEnglish: "Al-Insan",
        versesCount: 31),
    Surah(
        suraId: 77,
        nameArabic: "المرسلات",
        nameEnglish: "Al-Mursalat",
        versesCount: 50),
    Surah(
        suraId: 78,
        nameArabic: "النبأ",
        nameEnglish: "An-Naba",
        versesCount: 40),
    Surah(
        suraId: 79,
        nameArabic: "النازعات",
        nameEnglish: "An-Nazi'at",
        versesCount: 46),
    Surah(suraId: 80, nameArabic: "عبس", nameEnglish: "Abasa", versesCount: 42),
    Surah(
        suraId: 81,
        nameArabic: "التكوير",
        nameEnglish: "At-Takwir",
        versesCount: 29),
    Surah(
        suraId: 82,
        nameArabic: "الانفطار",
        nameEnglish: "Al-Infitar",
        versesCount: 19),
    Surah(
        suraId: 83,
        nameArabic: "المطففين",
        nameEnglish: "Al-Mutaffifin",
        versesCount: 36),
    Surah(
        suraId: 84,
        nameArabic: "الانشقاق",
        nameEnglish: "Al-Inshiqaq",
        versesCount: 25),
    Surah(
        suraId: 85,
        nameArabic: "البروج",
        nameEnglish: "Al-Buruj",
        versesCount: 22),
    Surah(
        suraId: 86,
        nameArabic: "الطارق",
        nameEnglish: "At-Tariq",
        versesCount: 17),
    Surah(
        suraId: 87,
        nameArabic: "الأعلى",
        nameEnglish: "Al-A'la",
        versesCount: 19),
    Surah(
        suraId: 88,
        nameArabic: "الغاشية",
        nameEnglish: "Al-Ghashiya",
        versesCount: 26),
    Surah(
        suraId: 89,
        nameArabic: "الفجر",
        nameEnglish: "Al-Fajr",
        versesCount: 30),
    Surah(
        suraId: 90,
        nameArabic: "البلد",
        nameEnglish: "Al-Balad",
        versesCount: 20),
    Surah(
        suraId: 91,
        nameArabic: "الشمس",
        nameEnglish: "Ash-Shams",
        versesCount: 15),
    Surah(
        suraId: 92,
        nameArabic: "الليل",
        nameEnglish: "Al-Lail",
        versesCount: 21),
    Surah(
        suraId: 93,
        nameArabic: "الضحى",
        nameEnglish: "Ad-Duhaa",
        versesCount: 11),
    Surah(
        suraId: 94,
        nameArabic: "الشرح",
        nameEnglish: "Ash-Sharh",
        versesCount: 8),
    Surah(
        suraId: 95, nameArabic: "التين", nameEnglish: "At-Tin", versesCount: 8),
    Surah(
        suraId: 96,
        nameArabic: "العلق",
        nameEnglish: "Al-Alaq",
        versesCount: 19),
    Surah(
        suraId: 97,
        nameArabic: "القدر",
        nameEnglish: "Al-Qadr",
        versesCount: 5),
    Surah(
        suraId: 98,
        nameArabic: "البينة",
        nameEnglish: "Al-Bayyina",
        versesCount: 8),
    Surah(
        suraId: 99,
        nameArabic: "الزلزلة",
        nameEnglish: "Az-Zalzalah",
        versesCount: 8),
    Surah(
        suraId: 100,
        nameArabic: "العاديات",
        nameEnglish: "Al-Adiyat",
        versesCount: 11),
    Surah(
        suraId: 101,
        nameArabic: "القارعة",
        nameEnglish: "Al-Qari'a",
        versesCount: 11),
    Surah(
        suraId: 102,
        nameArabic: "التكاثر",
        nameEnglish: "At-Takathur",
        versesCount: 8),
    Surah(
        suraId: 103,
        nameArabic: "العصر",
        nameEnglish: "Al-Asr",
        versesCount: 3),
    Surah(
        suraId: 104,
        nameArabic: "الهمزة",
        nameEnglish: "Al-Humazah",
        versesCount: 9),
    Surah(
        suraId: 105,
        nameArabic: "الفيل",
        nameEnglish: "Al-Fil",
        versesCount: 5),
    Surah(
        suraId: 106,
        nameArabic: "قريش",
        nameEnglish: "Quraish",
        versesCount: 4),
    Surah(
        suraId: 107,
        nameArabic: "الماعون",
        nameEnglish: "Al-Ma'un",
        versesCount: 7),
    Surah(
        suraId: 108,
        nameArabic: "الكوثر",
        nameEnglish: "Al-Kawthar",
        versesCount: 3),
    Surah(
        suraId: 109,
        nameArabic: "الكافرون",
        nameEnglish: "Al-Kafiroon",
        versesCount: 6),
    Surah(
        suraId: 110,
        nameArabic: "النصر",
        nameEnglish: "An-Nasr",
        versesCount: 3),
    Surah(
        suraId: 111,
        nameArabic: "المسد",
        nameEnglish: "Al-Masad",
        versesCount: 5),
    Surah(
        suraId: 112,
        nameArabic: "الإخلاص",
        nameEnglish: "Al-Ikhlas",
        versesCount: 4),
    Surah(
        suraId: 113,
        nameArabic: "الفلق",
        nameEnglish: "Al-Falaq",
        versesCount: 5),
    Surah(
        suraId: 114,
        nameArabic: "الناس",
        nameEnglish: "An-Nas",
        versesCount: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranTabBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Image.asset(
              "assets/images/islami_image.png",
            ).setHorizontalPadding(context, 0.13),
            SizedBox(height: 20),
            TextFormField(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Janna",
                color: AppColors.titleTextColor,
              ),
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                prefixIcon: Image.asset("assets/icons/quran_search_icon.png"),
                hintText: "Sura name",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Janna",
                  color: AppColors.titleTextColor,
                ),
                filled: true,
                fillColor: AppColors.secondaryColor.withOpacity(0.7),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
              ),
            ).setHorizontalPadding(context, 0.04),
            Text(
              "Most Recently",
              style: TextStyle(
                fontFamily: "Janna",
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: AppColors.titleTextColor,
              ),
            ).setHorizontalAndVerticalPadding(context, 0.05, 0.02),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: recentDataList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => RecentCardWidget(
                  mostRecentlyQuranModel: recentDataList[index],
                ),
              ),
            ).setHorizontalPadding(context, 0.01),
            Text(
              "Suras List",
              style: TextStyle(
                fontFamily: "Janna",
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: AppColors.titleTextColor,
              ),
            ).setHorizontalAndVerticalPadding(context, 0.05, 0.02),
            //SizedBox(height: 10),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: quranSurahs.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => _onSurahTap(index),
                child: SuraCardWidget(surahModel: quranSurahs[index]),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(endIndent: 60, indent: 60),
            ),
          ],
        ),
      ),
    );
  }

  _onSurahTap(index) {
    recentSurahIndexList.add(index.toString());

    LocalStorageService.setList(
        LocalStorageKeys.recentSurah, recentSurahIndexList);

    {
      Navigator.pushNamed(
        context,
        AppRoutes.quranDetailsScreen,
        arguments: quranSurahs[index],
      );
    }
  }

  _loadRecentSurah() {
    recentSurahIndexList =
        LocalStorageService.getList(LocalStorageKeys.recentSurah) ?? [];

    for(var index in recentSurahIndexList)
      {
        var indexInt= int.parse(index);
        recentDataList.add(quranSurahs[indexInt]);
      }


  }
}
