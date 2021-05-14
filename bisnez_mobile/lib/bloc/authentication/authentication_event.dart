part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final ModelUser user;

  AuthenticationLoggedIn({@required this.user});

@override
  List<Object> get props => [user];
}

class AuthenticationLoggedInForFirstTime extends AuthenticationEvent {
  final ModelUser user;

  AuthenticationLoggedInForFirstTime({@required this.user});

@override
  List<Object> get props => [user];
}

class AuthenticationLoggedOut extends AuthenticationEvent {}