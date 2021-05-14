part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends RegisterEvent {
  final String email;
  final String password;

  SignUpEvent({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}
