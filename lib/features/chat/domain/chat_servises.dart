import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_app/features/chat/data/models/message.dart';

class Chatservices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
