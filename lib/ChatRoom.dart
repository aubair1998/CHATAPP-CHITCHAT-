import 'package:FirbaseAuthentication/Constants.dart';
import 'package:FirbaseAuthentication/SignIn.dart';
import 'package:FirbaseAuthentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:FirbaseAuthentication/ViewSearch.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthService auth = new AuthService();
  void choiceAction(String choice) {
    if (choice == Constants.SignOut) {
      auth.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    } else if (choice == Constants.Settings) {
      print('settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chit Chat'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ViewSearch()));
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.search),
      ),
    );
  }
}
