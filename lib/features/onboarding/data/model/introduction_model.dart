import 'package:old_but_gold/i18n/strings.g.dart';

class IntroductionModel {
  final String image;
  final String title;
  final String subTitle;
  IntroductionModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<IntroductionModel> introList = [
  IntroductionModel(
    image: 'assets/images/intro_01.png',
    title: t.onboarding.lowestPricesEverInTheMarket,
    subTitle: t.onboarding.findBestDealsDescription,
  ),
  IntroductionModel(
    image: 'assets/images/intro_02.png',
    title: t.onboarding.tailoredFeatures,
    subTitle: t.onboarding.tailoredRecommendationsDescription,
  ),
  IntroductionModel(
    image: 'assets/images/intro_03.png',
    title: t.onboarding.buyAndGetPaidTitle,
    subTitle: t.onboarding.buyAndGetPaidDescription,
  ),
];
