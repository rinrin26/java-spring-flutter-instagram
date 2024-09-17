part of 'login_bloc.dart';
class LoginState extends Equatable {
  final UserModel? userData;
  final bool isLoading;
  final String errorMessage;
  final bool loginSuccess;

  LoginState({
    this.userData,
    this.isLoading = false,
    this.errorMessage = '',
    this.loginSuccess = false,
  });

  @override
  List<Object?> get props => [userData, isLoading, errorMessage, loginSuccess];
}