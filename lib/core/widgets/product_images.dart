import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/features/onboarding/ui/widgets/dots_indicator.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({super.key});

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> productImages = [
    'assets/images/test_image.png',
    'assets/images/test_image.png',
    'assets/images/test_image.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 380.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: productImages.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return Image.asset(productImages[index], fit: BoxFit.cover);
            },
          ),
        ),
        Positioned(
          bottom: 50.h,
          child: DotsIndicator(
            dotsCount: productImages.length,
            currentDot: _currentPage,
            dotSize: 10,
          ),
        ),
      ],
    );
  }
}
