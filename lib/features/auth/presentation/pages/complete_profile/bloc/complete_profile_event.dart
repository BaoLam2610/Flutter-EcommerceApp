part of 'complete_profile_bloc.dart';

sealed class CompleteProfileEvent extends BlocEvent {
  final UserRegister? userRegister;

  const CompleteProfileEvent(this.userRegister);
}

class ValidateCompleteProfile extends CompleteProfileEvent {
  const ValidateCompleteProfile(UserRegister? userRegister)
      : super(userRegister);
}
