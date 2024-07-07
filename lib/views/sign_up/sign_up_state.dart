import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class Initial extends SignUpState {}

class Loading extends SignUpState {}

class Loaded extends SignUpState {
  // final UserEntity user;

  // const Loaded({required this.user});

  // @override
  // List<Object> get props => [user];
}

class Failed extends SignUpState {
  final String error;

  const Failed({required this.error});

  @override
  List<Object> get props => [error];
}
