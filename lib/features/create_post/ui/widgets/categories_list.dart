import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/features/create_post/manager/categories_cubit/categories_cubit.dart';
import 'package:old_but_gold/features/create_post/manager/categories_cubit/categories_state.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int? selectedIndex;
  String? selectedCategory;
  String? selectedSubCategory;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return Padding(
            padding: const EdgeInsets.only(top: 300),
            child: SizedBox(
              width: double.infinity,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is CategoriesSuccess) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.categoriesModel.data.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: selectedIndex == null || isSelected
                    ? 1
                    : 0.3, // fade others
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = isSelected ? null : index;
                          selectedCategory =
                              state.categoriesModel.data[index].name.en;
                        });
                        if (state
                            .categoriesModel
                            .data[index]
                            .subCategories
                            .isEmpty) {
                          Navigator.pop(context, {
                            'category': selectedCategory,
                            'subCategory': '',
                          });
                        }
                      },
                      child: CategoryCard(
                        title: state.categoriesModel.data[index].name.en,
                        iconPath: 'assets/icons/onboarding/onboarding_7.svg',
                      ),
                    ),
                    if (isSelected &&
                        state
                            .categoriesModel
                            .data[index]
                            .subCategories
                            .isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 14),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: state
                              .categoriesModel
                              .data[index]
                              .subCategories
                              .map(
                                (sub) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSubCategory = sub.name.en;
                                      Navigator.pop(context, {
                                        'category': selectedCategory,
                                        'subCategory': selectedSubCategory,
                                      });
                                    });
                                  },
                                  child: Container(
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
                                        Text(
                                          sub.name.en,
                                          style: AppTextStyles.medium14,
                                        ),
                                      ],
                                    ),
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
        } else if (state is CategoriesFailure) {
          return Text(state.errorMessage);
        } else {
          return Text('Unknown error pleas try again later');
        }
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
