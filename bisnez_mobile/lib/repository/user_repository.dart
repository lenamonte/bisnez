import 'package:basic_login_page/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ModelUser _firebaseUser(User user) {
    return user != null ? ModelUser(id: user.uid, email: user.email) : null;
  }

  ModelUser getCurrentUser() {
    return _firebaseUser(_auth.currentUser);
  }

  Future<ModelUser> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _firebaseUser(user);
    }catch(e) {
      return null;
    }
  }

  Future<ModelUser> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _firebaseUser(user);
    }catch(e) {
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    }catch(e) {
      return null;
    }
  }

  Future sendUserToFirestore( String name, String email, String experiences, 
  String office, String city, String state, String about, String phone, 
  int followers, int following, int posts) async{
    try {
      final firebaseUser =  AuthService().getCurrentUser();
      final firestoreInstance = FirebaseFirestore.instance;
      return firestoreInstance.collection("user").doc(firebaseUser.id).set(
      {
        "name" : name,
        "contact_email" : email,
        "contact_number": phone,
        "experiences" : experiences,
        "office" : office,
        "localization_city" : city,
        "localization_state" : state,
        "about" : about,
        "followers" : followers,
        "following" : following,
        "posts" : posts,
      });

    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}