import '../../../../../core/core.dart';

part 'profile_state.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  ProfileCubit() : super(ProfileState(status: Initialize()));
}
