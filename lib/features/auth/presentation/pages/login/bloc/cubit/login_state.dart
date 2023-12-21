import '../../../../../../../core/bloc/bloc_state.dart';
import '../../../../../data/dto/login_dto.dart';
import '../../../../../domain/models/login/user_login.dart';

class LoginState extends StatusState {
  // final UserLogin? userLogin;
  // final LoginDto? loginDto;
  //
  // LoginState({super.status, this.userLogin, this.loginDto});
  //
  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     (other is LoginState &&
  //         runtimeType == other.runtimeType &&
  //         userLogin == other.userLogin);
  //
  // @override
  // int get hashCode => userLogin.hashCode;

  // @override
  // LoginState copyWith({
  //   Status? status,
  //   dynamic data,
  //   String? message,
  //   LoginDto? loginDto,
  //   UserLogin? userLogin,
  // }) {
  //   return LoginState(
  //     status: status ?? super.status,
  //     userLogin: userLogin ?? this.userLogin,
  //     loginDto: loginDto,
  //   );
  // }
  // @override
  // LoginState copyWith({
  //   LoginDto? loginDto,
  //   UserLogin? userLogin,
  //   Status? status,
  // }) {
  //   return LoginState(
  //     status: status ?? super.status,
  //     userLogin: userLogin ?? this.userLogin,
  //     loginDto: loginDto,
  //   );
  // }
}
