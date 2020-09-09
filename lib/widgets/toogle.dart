import 'package:FirbaseAuthentication/SignIn.dart';
import 'package:FirbaseAuthentication/SignUp.dart';
import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool showsignIn = true;
  void toogleView() {
    setState(() {
      showsignIn = !showsignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showsignIn) {
      return SignIn(toogleView);
    } else {
      return SignUp(toogleView);
    }
  }
}
