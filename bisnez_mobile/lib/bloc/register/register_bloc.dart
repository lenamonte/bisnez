import 'dart:async';

import 'package:basic_login_page/bloc/authentication/authentication_bloc.dart';
import 'package:basic_login_page/model/user.dart';
import 'package:basic_login_page/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService _authService;
  final AuthenticationBloc _authenticationBloc;

  RegisterBloc({AuthService auth, AuthenticationBloc authenticationBloc })
   : _authService = auth,
   _authenticationBloc = authenticationBloc,
   super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if(event is SignUpEvent) {
      yield* _mapSignUpEvent(event);
    }
  }

  Stream<RegisterState> _mapSignUpEvent(SignUpEvent event) async*{
    yield RegisterStart();

    try {
      final ModelUser user = await signUp(event.email, event.password);
      if(user == null) {
        yield RegisterFailureState(errorMessage: "Email ou Senha Invalidos!");
      }
      else {
        _authenticationBloc.add(AuthenticationLoggedIn(user: user));
        yield RegisterSuccessState(user: user);
      }

    } catch (e) {
      yield RegisterFailureState(errorMessage: "Algo deu errado. Tente novamente mais tarde");
    }
  }

  Future<ModelUser> signUp(String email, String password) async{
    return this._authService.registerWithEmailAndPassword(email, password);
  }
}
