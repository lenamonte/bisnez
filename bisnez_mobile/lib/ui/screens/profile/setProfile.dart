import 'package:basic_login_page/bloc/authentication/authentication_bloc.dart';
import 'package:basic_login_page/constants/inputDecoration.dart';
import 'package:basic_login_page/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetProfile extends StatefulWidget {
  @override
  _SetProfileState createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  final _formKey = GlobalKey<FormState>();
  AuthService _auth = AuthService();
  AuthenticationBloc bloc;

  String _name = '';
  String _email = '';
  String _experiences = '';
  String _office = '';
  String _city = '';
  String _state = '';
  String _about = '';
  String _phone = '';

  Future _wasDataSaved() async {
    final check = await _auth.sendUserToFirestore(_name, _email, _experiences,
        _office, _city, _state, _about, _phone, 0, 0, 0);

    print(check);
    return check;
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                    "Antes de começar, gostariamos de saber algumas coisas sobre você..."),
                SizedBox(
                  height: 10.0,
                ),
                Text("Campos com * são obrigatórios"),
                SizedBox(
                  height: 10.0,
                ),
                Text("Seu nome*"),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Digite o seu nome' : null,
                  onChanged: (val) {
                    setState(() => _name = val);
                  },
                  keyboardType: TextInputType.name,
                  decoration: textInputDecoration.copyWith(
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
                Text("Email para contato"),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() => _email = val);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: textInputDecoration.copyWith(
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
                Text("Telefone para contato"),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() => _phone = val);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: textInputDecoration.copyWith(
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
                Text("Experiência"),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() => _experiences = val);
                  },
                  keyboardType: TextInputType.text,
                  decoration: textInputDecoration.copyWith(
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
                Text("Office"),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() => _office = val);
                  },
                  keyboardType: TextInputType.text,
                  decoration: textInputDecoration.copyWith(
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
                Text("Cidade*"),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Digite sua cidade' : null,
                  onChanged: (val) {
                    setState(() => _city = val);
                  },
                  keyboardType: TextInputType.text,
                  decoration: textInputDecoration.copyWith(
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
                Text("Estado*"),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Digite seu estado' : null,
                  onChanged: (val) {
                    setState(() => _state = val);
                  },
                  keyboardType: TextInputType.text,
                  decoration: textInputDecoration.copyWith(
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
                Text("Descrição"),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() => _about = val);
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: textInputDecoration.copyWith(
                    focusedBorder: cyanBorder,
                    enabledBorder: cyanBorder,
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan[700],
                      onPrimary: Colors.white,
                      padding: EdgeInsets.all(18),
                    ),
                    child: Text(
                      'Enviar',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        if (_wasDataSaved() != null) {
                          bloc.add(
                            AuthenticationLoggedIn(
                                user: _auth.getCurrentUser()),
                          );
                        } else
                          print('Oops. Houve um erro');
                      }
                    }),
              ],
            ),
          )),
    );
  }
}
