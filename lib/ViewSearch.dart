import 'package:FirbaseAuthentication/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ViewSearch extends StatefulWidget {
  @override
  _ViewSearchState createState() => _ViewSearchState();
}

class _ViewSearchState extends State<ViewSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChitChat'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //fullscreen cover
        child: Column(
          children: <Widget>[
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            //   child: TextField(
            //     style: textFieldstyle(),
            //     decoration: inputdeco('Search Username'),
            //   ),
            // )
            Container(
              color: Colors.black12,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    style: textFieldstyle(),
                    decoration: InputDecoration(
                        hintText: 'Search UserName',
                        hintStyle: TextStyle(color: Colors.green),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  )),
                  Image.asset(
                    'assets/search.png',
                    color: Colors.white,
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
