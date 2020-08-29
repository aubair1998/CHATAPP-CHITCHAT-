import 'package:flutter/material.dart';

AppBar appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset(
      'assets/chit.png',
      color: Colors.white,
      height: 50,
    ),
  );
}

InputDecoration inputdeco(String hint) {
  return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)));
}

TextStyle textFieldstyle() {
  return TextStyle(color: Colors.white);
}

TextStyle textFieldstylemedium() {
  return TextStyle(color: Colors.white, fontSize: 15);
}
