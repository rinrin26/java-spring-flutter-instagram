part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class AuthLogin extends LoginEvent {
  final String username;
  final String password;

  AuthLogin({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class AuthLogout extends LoginEvent {}
