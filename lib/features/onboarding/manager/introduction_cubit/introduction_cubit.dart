import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/features/onboarding/data/model/introduction_model.dart';
import 'package:old_but_gold/features/onboarding/manager/introduction_cubit/introduction_state.dart';

class IntroductionCubit extends Cubit<IntroductionState> {
  IntroductionCubit() : super(const IntroductionState(currentIndex: 0));
  PageController pageController = PageController();
  int currentIndex = 0;
  void nextPage() async {
    if (state.currentIndex < introList.length - 1) {
      currentIndex = state.currentIndex + 1;
      await pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentIndex: currentIndex));
    }
  }

  void updatePageIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
