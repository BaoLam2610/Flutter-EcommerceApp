part of 'main_cubit.dart';

class MainState extends Equatable {
  final int currentIndex;

  const MainState({
    this.currentIndex = 0,
  });

  @override
  List<Object> get props => [currentIndex];

  MainState copyWith({
    int? currentIndex,
  }) {
    return MainState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
