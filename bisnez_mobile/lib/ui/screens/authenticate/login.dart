import 'package:basic_login_page/bloc/authentication/authentication_bloc.dart';
import 'package:basic_login_page/bloc/login/login_bloc.dart';
import 'package:basic_login_page/repository/user_repository.dart';
import 'package:basic_login_page/ui/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  final String errorMessage;

  LoginPage({this.errorMessage});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    final authService = RepositoryProvider.of<AuthService>(context);

    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(auth: authService, authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: SignIn(errorMessage: widget.errorMessage)
      ),
    ); 
    
    
  }
}