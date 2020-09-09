//mine code
//import 'package:FirbaseAuthentication/Home.dart';
import 'package:FirbaseAuthentication/DashBoard.dart';
import 'package:FirbaseAuthentication/Services/Database.dart';
import 'package:FirbaseAuthentication/Services/helper.dart';
import 'package:FirbaseAuthentication/SignUp.dart';
import 'package:FirbaseAuthentication/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:FirbaseAuthentication/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService auth = new AuthService();
  TextEditingController emailtexteditcon = new TextEditingController();
  TextEditingController passwordtexteditcon = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  bool isloading = false;
  QuerySnapshot querySnapshot;
  var formkey = GlobalKey<FormState>();

  signInwithvalidation() {
    final formState = formkey.currentState;

    if (formState.validate()) {
      formState.save();

      databaseMethods.getuserbyuserEmail(emailtexteditcon.text).then((val) {
        querySnapshot = val;
        Helperfunctions.saveUserEmailSharedPreference(
            querySnapshot.docs[0].data()["email"]);
        Helperfunctions.saveUserNameSharedPreference(
            querySnapshot.docs[0].data()["name"]);
      });
      try {
        auth
            .signIn(emailtexteditcon.text, passwordtexteditcon.text)
            .then((value) => {
                  if (value.uID != null)
                    {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Dashboard()))
                    }
                });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      validator: (val) {
                        return RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(val)
                            ? null
                            : "inavalid format of email";
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailtexteditcon,
                      style: textFieldstyle(),
                      decoration: inputdeco('Email'),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) {
                        return val.length > 6
                            ? null
                            : "Please provide password above then 6 characters";
                      },
                      style: textFieldstyle(),
                      decoration: inputdeco('Password'),
                      controller: passwordtexteditcon,
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
                      onTap: signInwithvalidation,
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50)),
                          width: MediaQuery.of(context).size.width,
                          child: Text('Sign In',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 19))),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Dont have account? ',
                          style: textFieldstylemedium(),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: GestureDetector(
                              onTap: () {
                                widget.toggle();
                              },
                              child: Text(' Register now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline)),
                            ),
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
        ));
  }
}
