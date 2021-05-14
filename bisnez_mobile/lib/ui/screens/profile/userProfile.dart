import 'package:basic_login_page/ui/arguments/UserArgument.dart';
import 'package:basic_login_page/ui/widgets/BottomBar.dart';
import 'package:basic_login_page/ui/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {

  final UserArgument arguments;

  UserProfile({this.arguments});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final firestoreInstance = FirebaseFirestore.instance;
  DocumentSnapshot _user;
  
  @override
  Widget build(BuildContext context) {
    firestoreInstance.collection('user')
    .doc(widget.arguments.id)
    .get()
    .then((value) => setState(() {
        _user = value;
      }));

    return Scaffold(
        body:
        _user == null ? 
        Loading() :
        _user.data() == null ? 
        Text("Você ainda não nos falou nada sobre você") :
        SingleChildScrollView(
          child: Column(
            children: [
              Text("About:"),
              _user.data()["about"] == null ? Text(" ") : Text(_user.data()["about"]),
              Text("Email"),
              _user.data()["contact_email"] == null ? Text(" ") : Text(_user.data()["contact_email"]),
              Text("Experiences:"),
              _user.data()["experiences"] == null ? Text(" ") : Text(_user.data()["experiences"]),
              Text("Followers:"),
              _user.data()["followers"] == null ? Text('0') : Text('${_user.data()["followers"]}'),
              Text("Following:"),
              _user.data()["following"] == null ? Text('0') : Text('${_user.data()["following"]}'),
              Text("Cidade:"),
              _user.data()["localization_city"] == null ? Text(" ") : Text(_user.data()["localization_city"]),
              Text("Estado:"),
              _user.data()["localization_state"] == null ? Text(" ") : Text(_user.data()["localization_state"]),
              Text("Nome:"),
              _user.data()["name"] == null ? Text(" ") : Text(_user.data()["name"]),
              Text("Office:"),
              _user.data()["office"] == null ? Text(" ") : Text(_user.data()["office"]),
              Text("Posts:"),
              _user.data()["posts"] == null ? Text('0') : Text('${_user.data()["posts"]}'),
            ],
          ),
      ),
      bottomNavigationBar: BottomBar(position: 4,),
    );
  }
}