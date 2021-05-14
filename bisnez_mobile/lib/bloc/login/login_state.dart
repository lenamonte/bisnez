part of 'login_bloc.dart';

abstract class LoginState extends Equatable{
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class StartLogin extends LoginState {}

class SuccessLoginState extends LoginState {
  final ModelUser user;

  SuccessLoginState({this.user});

  @override
  List<Object> get props => [user];
}

class ErrorLoginState extends LoginState {
  final String message;

  ErrorLoginState({this.message});
  
  @override
  List<Object> get props => [message];
}