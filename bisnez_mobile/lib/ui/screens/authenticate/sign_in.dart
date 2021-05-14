import 'package:basic_login_page/bloc/authentication/authentication_bloc.dart';
import 'package:basic_login_page/bloc/login/login_bloc.dart';
import 'package:basic_login_page/bloc/register/register_bloc.dart';
import 'package:basic_login_page/constants/showError.dart';
import 'package:basic_login_page/ui/widgets/loading.dart';
import 'package:basic_login_page/repository/user_repository.dart';
import 'package:basic_login_page/ui/screens/authenticate/registrate.dart';
import 'package:flutter/material.dart';
import 'package:basic_login_page/constants/inputDecoration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  final String errorMessage;

  SignIn({this.errorMessage});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  LoginBloc bloc;

  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<LoginBloc>(context);

    void _authenticate() {
      final signInEvent = SignInEvent(email: _email, password: _password);
      bloc.add(signInEvent);
    }

    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is ErrorLoginState) {
        showError(state.message, context);
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is StartLogin) {
          return Center(
            child: Loading(),
          );
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Container(
                child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    child: Text(
                      "Bem-vindo \n à Bisnez",
                      style: TextStyle(
                          color: Colors.cyan[700],
                          fontSize: 28,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/bisnez.png'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val.isEmpty ? 'Digite o seu email' : null,
                    onChanged: (val) {
                      setState(() => _email = val);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Email',
                      focusedBorder: cyanBorder,
                      enabledBorder: cyanBorder,
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (val) => val.length < 6
                        ? 'Sua senha precisa ter ao menos 6 caracteres'
                        : null,
                    onChanged: (val) {
                      setState(() => _password = val);
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Senha',
                      focusedBorder: cyanBorder,
                      enabledBorder: cyanBorder,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RaisedButton(
                      padding: EdgeInsets.all(18),
                      color: Colors.cyan[700],
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _authenticate();
                        }
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    _error,
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton.icon(
                    icon: Icon(
                      Icons.person,
                      color: Colors.cyan[700],
                    ),
                    label: Text('Cadastre-se',
                        style: TextStyle(color: Colors.cyan[700])),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Scaffold(
                                  body: BlocProvider.value(
                                    value: RegisterBloc(
                                        auth: AuthService(),
                                        authenticationBloc:
                                            BlocProvider.of<AuthenticationBloc>(
                                                context)),
                                    child: Register(),
                                  ),
                                )),
                      );
                    },
                  )
                ],
              ),
            )),
          ),
        );
      },
    ));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }
}
