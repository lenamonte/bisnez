import 'package:basic_login_page/bloc/authentication/authentication_bloc.dart';
import 'package:basic_login_page/bloc/register/register_bloc.dart';
import 'package:basic_login_page/constants/inputDecoration.dart';
import 'package:basic_login_page/constants/showError.dart';
import 'package:basic_login_page/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  Register();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterBloc bloc;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String _email = '';
  String _password = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<RegisterBloc>(context);

    void _registrate() {
      final signUpEvent = SignUpEvent(email: _email, password: _password);
      bloc.add(signUpEvent);
    }

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailureState)
          showError(state.errorMessage, context);
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterStart) {
            return Loading();
          }

          if (state is RegisterSuccessState) {
            BlocProvider.of<AuthenticationBloc>(context).add(
              AuthenticationLoggedInForFirstTime(user: state.user),
            );
            Navigator.pop(context);
          }

          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.asset('assets/bisnez.png'),
                        ),
                        Center(
                          child: Text(
                            "BISNEZ",
                            style: TextStyle(
                                color: Colors.cyan[700],
                                fontSize: 52,
                                fontWeight: FontWeight.w300),
                          ),
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
                            labelStyle: TextStyle(color: Colors.cyan[700]),
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
                            labelStyle: TextStyle(color: Colors.cyan[700]),
                            focusedBorder: cyanBorder,
                            enabledBorder: cyanBorder,
                          ),
                          style: TextStyle(
                            fontSize: 20,
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
                              'Cadastrar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _registrate();
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
                          label: Text('Login',
                              style: TextStyle(color: Colors.cyan[700])),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }
}
