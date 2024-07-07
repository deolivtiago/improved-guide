import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  // final AuthRepository authRepository;

  SignUpBloc() : super(Initial()) {
    on<SignUpSubmitEvent>(_onSubmit);
  }

  Future<void> _onSubmit(
      SignUpSubmitEvent event, Emitter<SignUpState> emit) async {
    emit(Loading());

    // final input = SignUpInput(
    //   firstName: event.firstName,
    //   lastName: event.lastName,
    //   email: event.email,
    //   password: event.password,
    // );

    // try {
    //   final user = await authRepository.signUp(input);
    await Future.delayed(const Duration(seconds: 3));

    emit(Loaded());

    //   emit(Loaded(user: user));
    // } on HttpError catch (e) {
    //   emit(Failed(error: e.error));
    // }
  }
}
