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
    title: 'Lowest Prices Ever in the market',
    subTitle:
        'Find the best deals in the market, good value with the lowest prices ever',
  ),
  IntroductionModel(
    image: 'assets/images/intro_02.png',
    title: 'Tailored Features just for you',
    subTitle:
        'Tailored recommendations catering you needs, with the option of selecting you preferences ',
  ),
  IntroductionModel(
    image: 'assets/images/intro_03.png',
    title: 'Buy your stuff , Get paid and more..',
    subTitle:
        'Create a post, have clients, and buy your items with trusted users',
  ),
];
