part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final BlocState status;

  const RegisterState({
    required this.status,
  });

  @override
  List<Object> get props => [status];

  RegisterState copyWith({
    BlocState? status,
  }) {
    return RegisterState(
      status: status ?? this.status,
    );
  }
}
