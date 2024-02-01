part of 'intro_cubit.dart';

class IntroState extends Equatable {
  final int currentIndex;

  const IntroState({
    this.currentIndex = 0,
  });

  @override
  List<Object> get props => [currentIndex];

  IntroState copyWith({
    int? currentIndex,
  }) {
    return IntroState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
