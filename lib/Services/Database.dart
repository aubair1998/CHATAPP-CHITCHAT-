import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getuserbyusername(nameforsearch) async {
    await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: nameforsearch)
        .get();
  }

  getuserbyuserEmail(emailforsearch) async {
    await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: emailforsearch)
        .get();
  }

  uploaduserdata(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  createChatRoom(String chatroomid, chatroomMap) {
    FirebaseFirestore.instance
        .collection('ChatRoom')
        .doc(chatroomid)
        .set(chatroomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
