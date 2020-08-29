//import 'package:FirbaseAuthentication/SignIn.dart';
// import 'package:FirbaseAuthentication/auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:FirbaseAuthentication/ChatRoom.dart';
import 'package:FirbaseAuthentication/SignIn.dart';
import 'package:FirbaseAuthentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:FirbaseAuthentication/SignUp.dart';
import 'package:FirbaseAuthentication/ViewSearch.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          // visualDensity: VisualDensity.adaptivePlatformDensity,

          scaffoldBackgroundColor: Color(0Xff1f1f1f),
          primaryColor: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ChatRoom());
  }
}

//zubair code

// class TestClass extends StatefulWidget {
//   @override
//   _TestClassState createState() => _TestClassState();
// }

// class _TestClassState extends State<TestClass> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//           RaisedButton(onPressed: () {
//             try {
//               FirebaseAuth.instance.signInWithEmailAndPassword(
//                   email: "test@mail.com", password: "12345678");
//             } catch (e) {
//               print(e);
//             }
//           })
//         ],
//       ),
//       body: AuthService().handleAuth(),
//     );
//   }
// }
