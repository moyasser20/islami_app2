class OnBoardingModel {
  String imgPath;
  String title;
  String? description;

  OnBoardingModel({
    required this.imgPath,
    required this.title,
    this.description,
  });

  static List<OnBoardingModel> onboardingList = [
    OnBoardingModel(
      imgPath: "assets/images/first_onboard.png",
      title: "Reading the Quran",
    ),
    OnBoardingModel(
      imgPath: "assets/images/Second_onboard.png",
      title: "Reading the Quran",
      description: "We Are Very Excited To Have You In Our Community"
    ),
    OnBoardingModel(
        imgPath: "assets/images/third_onboard.png",
        title: "Reading the Quran",
        description: "Read, and your Lord is the Most Generous"
    ),

    OnBoardingModel(
        imgPath: "assets/images/fourth_onboard.png",
        title: "Bearish",
        description: "Praise the name of your Lord, the Most High"
    ),
    OnBoardingModel(
        imgPath: "assets/images/fifth_onboard.png",
        title: "Holy Quran Radio",
        description: "You can listen to the Holy Quran Radio through the application for free and easily"
    ),


  ];
}
