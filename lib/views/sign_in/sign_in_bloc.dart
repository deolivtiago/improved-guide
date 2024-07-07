import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  // final AuthRepository authRepository;

  SignInBloc() : super(Initial()) {
    on<SignInSubmitEvent>(_onSubmit);
  }

  Future<void> _onSubmit(
      SignInSubmitEvent event, Emitter<SignInState> emit) async {
    emit(Loading());

    // final input = SignInInput(
    //   email: event.email,
    //   password: event.password,
    // );

    // try {
    // final user = await authRepository.signIn(input);
    await Future.delayed(const Duration(seconds: 3));

    emit(Loaded());
    //   emit(Loaded(user: user));
    // } on HttpError catch (e) {
    //   emit(Failed(error: e.error));
    // }
  }
}
