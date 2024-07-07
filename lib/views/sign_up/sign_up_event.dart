import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class SignUpSubmitEvent extends SignUpEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const SignUpSubmitEvent({
    required this.firstName,
    this.lastName = '',
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [firstName, lastName, email, password];
}
