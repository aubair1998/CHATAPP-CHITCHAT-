// import 'package:FirbaseAuthentication/Services/Database.dart';
// import 'package:FirbaseAuthentication/widgets/widgets.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ViewSearch extends StatefulWidget {
//   @override
//   _ViewSearchState createState() => _ViewSearchState();
// }

// class _ViewSearchState extends State<ViewSearch> {
//   TextEditingController searchtextcon = new TextEditingController();
//   DatabaseMethods databaseMethods = new DatabaseMethods();
//   QuerySnapshot searchSnapshot;
//   initiateSearch() {
//     databaseMethods.getuserbyusername(searchtextcon.text).then((val) {
//       setState(() {
//         searchSnapshot = val;
//       });
//     });
//   }

//   Widget searchList() {
//     return searchSnapshot != null
//         ? ListView.builder(
//             itemCount: searchSnapshot.docs.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return SearchTile(
//                   username: searchSnapshot.docs[index].data()["name"],
//                   email: searchSnapshot.docs[index].data());
//             })
//         : Container();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ChitChat'),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         color: Colors.red,
//         //fullscreen cover
//         child: Column(
//           children: <Widget>[
//             Container(
//               width: MediaQuery.of(context).size.width,
//               color: Colors.black,
//               padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Container(
//                       child: TextField(
//                         controller: searchtextcon,
//                         style: textFieldstyle(),
//                         decoration: InputDecoration(
//                             hintText: 'Search UserName',
//                             hintStyle: TextStyle(color: Colors.green),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white)),
//                             enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white))),
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       // initiateSearch();
//                       await databaseMethods
//                           .getuserbyusername(searchtextcon.text)
//                           .then((val) {
//                         print(val.toString());
//                       });
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * .11,
//                       child: Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                             color: Colors.grey,
//                             borderRadius: BorderRadius.circular(100)),
//                         child: Image.asset(
//                           'assets/search.png',
//                           color: Colors.white,
//                           height: 50,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchTile extends StatelessWidget {
//   final username;
//   final email;
//   SearchTile({this.username, this.email});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: <Widget>[
//           Column(
//             children: <Widget>[Text(username), Text(email)],
//           ),
//           Spacer(),
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.blue, borderRadius: BorderRadius.circular(34)),
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Text('Message'),
//           )
//         ],
//       ),
//     );
//   }
// }
