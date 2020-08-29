import 'package:FirbaseAuthentication/ChatRoom.dart';
import 'package:FirbaseAuthentication/Models/userPerson.dart';
import 'package:FirbaseAuthentication/SignIn.dart';
//import 'package:FirbaseAuthentication/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  handleAuth() {
    return StreamBuilder(
      stream: _auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          return ChatRoom();
          //Container(
          //   child: Text("user logged in ${snapshot.data.uid}"),
          // );
        } else {
          return SignIn();
        }
      },
    );
  }

//....................................................................................
  UserPerson _userfromFirebaseUser(User user) {
    return user != null ? UserPerson(uID: user.uid) : null;
  }

  Future signInwithvalidation(String email, String pass) async {
    UserCredential result;
    try {
      result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User firebaseuser = result.user;
      return _userfromFirebaseUser(firebaseuser);
    } catch (PlatformException) {
      print('Invalid email and passowrd');
      // ignore: dead_code_catch_following_catch
    } catch (e) {
      print(e);
    }
  }

  Future signUpwithvalidation(String email, String pass) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User firebaseuser = result.user;
      return _userfromFirebaseUser(firebaseuser);
    } catch (e) {
      print(e);
    }
  }
//................................................................................

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
