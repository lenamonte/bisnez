part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationNotAuthenticated extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final ModelUser user;

  AuthenticationSuccess({this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationSuccessForFirstTime extends AuthenticationState {
  final ModelUser user;

  AuthenticationSuccessForFirstTime({this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure({this.message});

  @override
  List<Object> get props => [message];

}
