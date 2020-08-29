//mine code
//import 'package:FirbaseAuthentication/Home.dart';
import 'package:FirbaseAuthentication/SignUp.dart';
import 'package:FirbaseAuthentication/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:FirbaseAuthentication/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService auth = new AuthService();
  TextEditingController emailtexteditcon = new TextEditingController();
  TextEditingController passwordtexteditcon = new TextEditingController();
  //bool isloading = false;

  var formkey = GlobalKey<FormState>();
  // bool signUpCheckvalidation() {
  //   final form = formkey.currentState;
  //   if (formkey.currentState.validate()) {
  //     form.save();
  //     print('valid input');
  //     return true;
  //     //  formkey.currentState.save();
  //     //FocusScope.of(context).unfocus();
  //   } else {
  //     print('invalid input');
  //     return false;
  //   }
  // }

  //
  // BEFOREEEEEEEEEEEEEEEEE PLZZ YEH PHLW WALA KAAM THA
  // Future<void> signInwithvalidation() async {
  //   final formState = formkey.currentState;

  //   if (formState.validate()) {
  //     formState.save();
  //     try {
  //       FirebaseAuth.instance.signInWithEmailAndPassword(
  //           email: emailtexteditcon.text, password: passwordtexteditcon.text);
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Home()));
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }
  signInwithvalidation() {
    final formState = formkey.currentState;

    if (formState.validate()) {
      formState.save();
      try {
        auth
            .signInwithvalidation(
                emailtexteditcon.text, passwordtexteditcon.text)
            .then((value) => {print("${value.uID}" + "yes")});
        // FirebaseAuth.instance.signInWithEmailAndPassword(
        //     email: emailtexteditcon.text, password: passwordtexteditcon.text);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Home()));
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
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(' Register now',
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
        ));
  }
}
