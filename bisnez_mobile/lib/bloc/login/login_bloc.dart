import 'dart:async';

import 'package:basic_login_page/bloc/authentication/authentication_bloc.dart';
import 'package:basic_login_page/model/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:basic_login_page/repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService;
  final AuthenticationBloc _authenticationBloc;

  LoginBloc({AuthService auth, AuthenticationBloc authenticationBloc}) 
    : _authService = auth,
    _authenticationBloc = authenticationBloc,
    super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is SignInEvent){
      yield* _mapSignInEvent(event);
    }
  }

  Stream<LoginState> _mapSignInEvent(SignInEvent event) async*{
    yield StartLogin();

    try {
      final ModelUser user = await authenticate(event.email, event.password);

      if(user != null) {
        _authenticationBloc.add(AuthenticationLoggedIn(user: user));
        yield SuccessLoginState();
      }
      else {
        yield ErrorLoginState(message: 'Login e senha Invalidos');
      }
    } catch (e) {
      yield ErrorLoginState(message: 'Ops... Algo deu errado');
    }
  }

  Future<ModelUser> authenticate(String email, String password) async{
    return this._authService.signInWithEmailAndPassword(email, password);
  }

  Future<void> logOut() async{
    return this._authService.signOut();
  }
}