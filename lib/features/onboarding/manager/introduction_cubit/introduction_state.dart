class IntroductionState {
  final int currentIndex;

  const IntroductionState({required this.currentIndex});

  IntroductionState copyWith({int? currentIndex}) {
    return IntroductionState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
