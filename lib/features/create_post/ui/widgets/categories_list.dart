import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int? selectedIndex;

  final List<String> categories = [
    "Electronics",
    "Gaming",
    "Hobbies & Crafts",
    "Beauty & Health",
    "Fashion",
    "Sports",
    "Books",
    "Home & Kitchen",
    "Toys",
    "Automotive",
  ];

  final Map<String, List<String>> subCategories = {
    "Electronics": ["Smartphones", "Tablets", "Laptops", "Accessories"],
    "Gaming": ["Consoles", "PC Gaming", "VR"],
  };

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: selectedIndex == null || isSelected ? 1 : 0.3, // fade others
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = isSelected ? null : index;
                  });
                },
                child: CategoryCard(
                  title: categories[index],
                  iconPath: 'assets/icons/onboarding/onboarding_7.svg',
                ),
              ),
              if (isSelected && subCategories[categories[index]] != null)
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 14),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        subCategories[categories[index]]!
                            .map(
                              (sub) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.mainFFEECA,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.label, size: 16),
                                    const SizedBox(width: 6),
                                    Text(sub, style: AppTextStyles.medium14),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String iconPath;
  const CategoryCard({super.key, required this.title, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.mainFFE09C,
            borderRadius: BorderRadius.circular(9),
          ),
          child: SvgPicture.asset(iconPath),
        ),
        const SizedBox(width: 20),
        Text(title, style: AppTextStyles.bold20),
        const Spacer(),
        const Icon(Icons.keyboard_arrow_right, size: 26),
      ],
    );
  }
}
