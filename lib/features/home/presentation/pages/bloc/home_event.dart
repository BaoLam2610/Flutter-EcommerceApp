part of 'home_bloc.dart';

sealed class HomeEvent extends BlocEvent {
  const HomeEvent();
}

class GetHomeData extends HomeEvent {
  const GetHomeData() : super();
}
