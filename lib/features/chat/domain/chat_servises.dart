import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_app/features/chat/data/models/message.dart';

class Chatservices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List IdsOfUser = [];
  List IdsOfUser1 = [];

  Stream<List<Map<String, dynamic>>> getUserStream2() async* {
    try {
      final chatRoomsSnapshot = await _firestore.collection("chatRooms").get();

      if (chatRoomsSnapshot.docs.isNotEmpty) {
        print(
            "Number of Documents in chatRooms: ${chatRoomsSnapshot.docs.length}");
        for (var doc in chatRoomsSnapshot.docs) {
          final user1 = doc.data(); // Cast user to Map<String, dynamic>
          IdsOfUser1.add(user1["uid"]);
          print("list1 : ${IdsOfUser1.length}");
          print("user :  $user1");
        }
      } else {
        print("No documents found in chatRooms collection.");
      }

      yield chatRoomsSnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Error fetching chatRooms: $e");
      // Handle error here
    }
  }

  // Stream<List<Map<String, dynamic>>> getUserStream2() async* {
  //   final chatRoomsSnapshot = await _firestore.collection("/chatRooms").get();
  //   print("##########${chatRoomsSnapshot.docs.length}");
  //   for (var doc in chatRoomsSnapshot.docs) {
  //     final user1 = doc.data(); // Cast user to Map<String, dynamic>
  //     IdsOfUser1.add(user1["uid"]);
  //     print("list1 : ${IdsOfUser1.length}");
  //     print("user :  ${user1}");
  //   }

  //   // final usersSnapshot = await _firestore.collection("users").get();
  //   // for (var doc in usersSnapshot.docs) {
  //   //   final user = doc.data(); // Cast user to Map<String, dynamic>
  //   //   IdsOfUser.add(user["uid"]);
  //   //   print("list : ${IdsOfUser}");
  //   //   print("user :  ${user}");
  //   // }

  //   yield chatRoomsSnapshot.docs.map((doc) => doc.data()).toList();
  // }

  // Stream<List<Map<String, dynamic>>> getUserStream2() {
  //   _firestore.collection("chatRooms").snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       final user1 = doc.data(); // Cast user to Map<String, dynamic>
  //       IdsOfUser1.add(user1["uid"]);
  //       print("list1 : ${IdsOfUser1}");
  //       print("user :  ${user1}");
  //       return user1;
  //     }).toList();
  //   });
  //   return _firestore.collection("users").snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       final user = doc.data(); // Cast user to Map<String, dynamic>
  //       IdsOfUser.add(user["uid"]);
  //       print("list : ${IdsOfUser}");
  //       print("user :  ${user}");
  //       return user;
  //     }).toList();
  //   });
  // }

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(
      String receiverID, message, bool ispdf, String url) async {
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timetemp = Timestamp.now();

    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receverId: receiverID,
      message: message,
      timestamp: timetemp,
      ispdf: ispdf,
      url: url,
    );

    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String charRoomID = ids.join('_');

    await _firestore
        .collection("chatRooms")
        .doc(charRoomID)
        .collection("message")
        .add(
          newMessage.toMap(),
        );
  }
}
