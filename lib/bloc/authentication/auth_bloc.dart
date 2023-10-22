import 'package:apple_shop/bloc/authentication/auth_event.dart';
import 'package:apple_shop/bloc/authentication/auth_state.dart';
import 'package:apple_shop/data/repository/authentication_repository.dart';
import 'package:apple_shop/di/di.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository = locator.get();
  AuthBloc() : super(AuthInitiateState()) {
    on<AuthLoginRequest>(((event, emit) async {
      emit(AuthLoadingState());
      var reponse = await _repository.login(event.username, event.password);
      emit(AuthResponseState(reponse));
    }));

    on<AuthRegisterRequest>(((event, emit) async {
      emit(AuthLoadingState());
      var reponse = await _repository.register(event.username, event.password,event.passwordConfirm);
      emit(AuthResponseState(reponse));
    }));
  }
}
