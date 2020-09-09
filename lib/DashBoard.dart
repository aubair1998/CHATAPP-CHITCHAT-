import 'package:FirbaseAuthentication/Constants.dart';
import 'package:FirbaseAuthentication/Services/Database.dart';
//import 'package:FirbaseAuthentication/SignIn.dart';
import 'package:FirbaseAuthentication/Services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchtextcon = new TextEditingController();
  bool isSearching = false;
  AuthService auth = new AuthService();
  QuerySnapshot searchSnapshot;
  void choiceAction(String choice) {
    if (choice == Constants.SignOut) {
      auth.signOut();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AuthService().handleAuth()));
    } else if (choice == Constants.Settings) {
      print('settings');
    }
  }

  initiateSearch() {
    databaseMethods.getuserbyusername('akifehsan').then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  createChatRoomAndStartConv(String username) {}
  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SearchTile(
                  username: searchSnapshot.docs[0].data()["name"],
                  email: searchSnapshot.docs[0].data()["email"]);
            })
        : Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: !isSearching
        //     ? Text('Chit Chat')
        //     :
        title: TextField(
            controller: searchtextcon,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: "Search Usernamee",
              hintStyle: TextStyle(color: Colors.white),
            )),
        actions: <Widget>[
          searchtextcon.text.isNotEmpty
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          // this.isSearching = false;
                          setState(() {
                            searchtextcon.clear();
                          });
                        });
                      }),
                )
              : Container(),
          GestureDetector(
            onTap: () {
              initiateSearch();
            },
            child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    // this.isSearching = true;
                  });
                }),
          ),
          isSearching
              ? Container()
              : PopupMenuButton<String>(
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

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => ViewSearch()));
      //   },
      //   backgroundColor: Colors.green,
      //   child: Icon(Icons.search),
      // ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('email', isGreaterThan: searchtextcon.text)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            print("has data");
            print(snapshot.data.docs.length);
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data.docs[index].data()['email']),
                  ),
                );
              },
            );
          } else {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );

    //  !isSearching
    //     ? StreamBuilder(
    //         stream:
    //             FirebaseFirestore.instance.collection('users').snapshots(),
    //         builder: (BuildContext context,
    //             AsyncSnapshot<QuerySnapshot> snapshot) {
    //           if (!snapshot.hasData) {
    //             return Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }

    //           return ListView(
    //               children: snapshot.data.docs.map((document) {
    //             return Container(
    //               decoration: BoxDecoration(
    //                 border: Border(bottom: BorderSide(color: Colors.grey)),
    //               ),
    //               padding: EdgeInsets.symmetric(
    //                 vertical: 20,
    //               ),
    //               child: ListTile(
    //                 leading: CircleAvatar(
    //                   radius: 40,
    //                   backgroundColor: Colors.grey,
    //                 ),
    //                 trailing: GestureDetector(
    //                   onTap: () {},
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                         color: Colors.white,
    //                         borderRadius: BorderRadius.circular(34)),
    //                     padding: EdgeInsets.symmetric(
    //                         horizontal: 16, vertical: 8),
    //                     child: Text('Message'),
    //                   ),
    //                 ),
    //                 subtitle: Text(
    //                   document.data()["email"],
    //                   style: TextStyle(color: Colors.grey),
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //                 title: Text(
    //                   document.data()["name"],
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             );
    //           }).toList());
    //         })
    //     : searchList());
  }
}

class SearchTile extends StatelessWidget {
  final username;
  final email;
  SearchTile({this.username, this.email});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[Text(username), Text(email)],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(34)),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Message'),
          )
        ],
      ),
    );
  }
}
