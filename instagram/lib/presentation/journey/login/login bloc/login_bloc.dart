import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/data/models/user_model.dart';
import 'package:instagram/services/api_instagram_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiInstagramService apiInstagramService;
  LoginBloc(this.apiInstagramService) : super(LoginState()) {
    on<AuthLogin>((event, emit) async {
      emit(LoginState(isLoading: true));
      try {
        final userAuth =
            await apiInstagramService.login(event.username, event.password);
        emit(LoginState(
            userData: userAuth, loginSuccess: true, isLoading: false));
      } catch (e) {
        emit(LoginState(
            errorMessage: e.toString(), loginSuccess: false, isLoading: false));
      }
    });
  }
}
