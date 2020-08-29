import 'package:FirbaseAuthentication/ChatRoom.dart';
// import 'package:FirbaseAuthentication/Models/userPerson.dart';
// import 'package:FirbaseAuthentication/SignIn.dart';
import 'package:FirbaseAuthentication/auth.dart';
import 'package:FirbaseAuthentication/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // AsyncSnapshot<User> snapshot;
  // UserPerson up = new UserPerson();
  bool isloading = false;
  // signUpforme() {
  //   if (formkey.currentState.validate()) {
  //     //  formkey.currentState.save();
  //     //FocusScope.of(context).unfocus();
  //     setState(() {
  //       isloading = true;
  //     });
  //     try {
  //       authServices
  //           .signUpWithEmailAndPassword(
  //               emailtexteditcon.text, passwordtexteditcon.text)
  //           .then((val) {
  //         print(val.userId + "has logged in");
  //       });
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }
  AuthService auth = new AuthService();
  var formkey = GlobalKey<FormState>();
  TextEditingController usertexteditcon = new TextEditingController();
  TextEditingController emailtexteditcon = new TextEditingController();
  TextEditingController passwordtexteditcon = new TextEditingController();
//before bht achi life
  // Future<void> signUpwithvalidation() async {
  //   final formState = formkey.currentState;
  //   if (formState.validate()) {
  //     formState.save();

  //     try {
  //       FirebaseAuth.instance.createUserWithEmailAndPassword(
  //           email: emailtexteditcon.text, password: passwordtexteditcon.text);
  //       //up.uID = snapshot.data.uid;
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Home()));
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }
  signUpwithvalidation() {
    final formState = formkey.currentState;

    if (formState.validate()) {
      formState.save();
      setState(() {
        isloading = true;
      });
      try {
        auth
            .signUpwithvalidation(
                emailtexteditcon.text, passwordtexteditcon.text)
            .then((value) => {
                  //print("${value.uID}" + "yes")
                });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isloading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 50,
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Form(
                        key: formkey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (val) {
                                return val.isEmpty || val.length < 2
                                    ? 'Invalid Username'
                                    : null;
                              },
                              controller: usertexteditcon,
                              style: textFieldstyle(),
                              decoration: inputdeco('Username'),
                            ),
                            TextFormField(
                              validator: (val) {
                                return RegExp(
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        .hasMatch(val)
                                    ? null
                                    : "inavalid format of email";
                              },
                              controller: emailtexteditcon,
                              style: textFieldstyle(),
                              decoration: inputdeco('Email'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: (val) {
                                return val.length > 6
                                    ? null
                                    : "Please provide password above then 6 characters";
                              },
                              controller: passwordtexteditcon,
                              style: textFieldstyle(),
                              decoration: inputdeco('Password'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Text(
                            'forgot Password??',
                            style: textFieldstyle(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        //solved?     whatsapp me what the problem is
                        onTap: signUpwithvalidation,
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50)),
                            width: MediaQuery.of(context).size.width,
                            child: Text('Sign Up',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19))),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // Container(
                      //     alignment: Alignment.center,
                      //     padding: EdgeInsets.symmetric(vertical: 18),
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(50)),
                      //     width: MediaQuery.of(context).size.width,
                      //     child: Text('SignUp with google',
                      //         style: TextStyle(color: Colors.black, fontSize: 16))),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have account ',
                            style: textFieldstylemedium(),
                          ),
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(' SignIn now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
