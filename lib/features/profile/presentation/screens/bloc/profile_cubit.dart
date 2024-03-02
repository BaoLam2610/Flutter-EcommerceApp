import '../../../../../core/bloc/base_bloc.dart';
import '../../../../../core/bloc/bloc_state.dart';

part 'profile_state.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  ProfileCubit() : super(ProfileState(status: Initialize()));
}
