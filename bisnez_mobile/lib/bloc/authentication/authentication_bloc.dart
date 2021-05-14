import 'dart:async';

import 'package:basic_login_page/model/user.dart';
import 'package:basic_login_page/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService _authService;

  AuthenticationBloc({AuthService authService})
  : this._authService = authService,
  super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if(event is AuthenticationStarted) {
      yield* _mapAppLoadedToState(event);
    }

    if(event is AuthenticationLoggedIn) {
      yield* _mapAppLoggedIn(event);
    }

    if(event is AuthenticationLoggedInForFirstTime) {
      yield* _mapAppLoggedInForFirstTime(event);
    }

    if(event is AuthenticationLoggedOut) {
      yield* _mapAppLoggedOut(event);
    }
  }

  Future<void> logOut() async{
    return this._authService.signOut();
  }

  Stream<AuthenticationState> _mapAppLoadedToState(AuthenticationStarted event) async* {
    yield AuthenticationLoading();
    try {
      await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
      final currentUser = _authService.getCurrentUser();

      if (currentUser != null) {
        yield AuthenticationSuccess(user: currentUser);
      } else {
        yield AuthenticationNotAuthenticated();
      }
    } catch (e) {
      yield AuthenticationFailure(message: e.message ?? 'Um erro interno ocorreu');
    }
  }

  Stream<AuthenticationState> _mapAppLoggedIn(AuthenticationLoggedIn event) async* {
    yield AuthenticationSuccess(user: event.user);
  }

  Stream<AuthenticationState> _mapAppLoggedInForFirstTime(AuthenticationLoggedInForFirstTime event) async* {
    yield AuthenticationSuccessForFirstTime(user: event.user);
  }

  Stream<AuthenticationState> _mapAppLoggedOut(AuthenticationLoggedOut event) async* {
    await _authService.signOut();
    yield AuthenticationNotAuthenticated();
  }

}
