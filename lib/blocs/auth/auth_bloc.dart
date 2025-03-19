import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc1/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    /*The method doesn't override an inherited method.
Try updating this class to match the superclass, or removing the override annotation. */
    if (event is LoginEvent) {
      yield AuthLoading();
      try {
        await authRepository.login(event.email, event.password);
        yield AuthAuthenticated();
      } catch (e) {
        yield AuthError(message: e.toString());
      }
    } else if (event is SignupEvent) {
      yield AuthLoading();
      try {
        await authRepository.signup(event.email, event.password);
        yield AuthAuthenticated();
      } catch (e) {
        yield AuthError(message: e.toString());
      }
    } else if (event is LogoutEvent) {
      yield AuthLoading();
      await authRepository.logout();
      yield AuthUnauthenticated();
    }
  }
}
