import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class Initial extends SignInState {}

class Loading extends SignInState {}

class Loaded extends SignInState {
  // final UserEntity user;

  // const Loaded({required this.user});

  // @override
  // List<Object> get props => [user];
}

class Failed extends SignInState {
  final String error;

  const Failed({required this.error});

  @override
  List<Object> get props => [error];
}
