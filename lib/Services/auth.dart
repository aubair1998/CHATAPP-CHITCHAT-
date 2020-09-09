import 'package:FirbaseAuthentication/DashBoard.dart';
// import 'package:FirbaseAuthentication/Models/userPerson.dart';
// import 'package:FirbaseAuthentication/SignIn.dart';
// import 'package:FirbaseAuthentication/SignUp.dart';
//import 'package:FirbaseAuthentication/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:FirbaseAuthentication/widgets/toogle.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  handleAuth() {
    return StreamBuilder(
      stream: _auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          return Dashboard();
          //Container(
          //   child: Text("user logged in ${snapshot.data.uid}"),
          // );
        } else {
          return Toggle();
        }
      },
    );
  }

//....................................................................................
  // UserPerson _userfromFirebaseUser(User user) {
  //   return user != null ? UserPerson(uID: user.uid) : null;
  // }

  Future signIn(String email, String pass) async {
    UserCredential result;
    try {
      result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      if (result != null) {
        User firebaseuser = result.user;
        return firebaseuser;
      }
    } catch (PlatformException) {
      print('Invalid email and passowrd');
      // ignore: dead_code_catch_following_catch
    } catch (e) {
      print(e);
    }
  }

  Future signUp(String email, String pass) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User firebaseuser = result.user;

      return firebaseuser;
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
