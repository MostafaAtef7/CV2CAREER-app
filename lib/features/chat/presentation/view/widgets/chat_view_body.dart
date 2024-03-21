import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'package:gp_app/features/chat/presentation/view/widgets/style_message.dart';
import 'package:gp_app/features/chat/presentation/view/widgets/text_of_send_message.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatViewBody extends StatefulWidget {
  final String reciveEmail;
  final String reciveID;

  const ChatViewBody(
      {super.key, required this.reciveEmail, required this.reciveID});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late UploadTask uploadTask;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final currentUserID = user?.uid;
    String senderID = BlocProvider.of<AuthCubit>(context).getCurrentuser()!.uid;

    List<String> ids = [widget.reciveID, senderID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.reciveEmail,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: chatColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder(
              stream: _firestore
                  .collection("chatRooms")
                  .doc(chatRoomID)
                  .collection("message")
                  .orderBy("timestamp")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container(
                    margin: const EdgeInsets.only(top: 110),
                    child: Image.asset(
                      "assets/images/400 Error Bad Request-cuate.png",
                      height: 260,
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      const SizedBox(height: 220),
                      Center(
                        child: LoadingAnimationWidget.waveDots(
                          size: 30,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        bool ispdf = snapshot
                            .data!.docs[snapshot.data!.docs.length - index - 1]
                            .data()["ispdf"];
                        bool isMe = true;
                        if (currentUserID ==
                            snapshot.data!
                                .docs[snapshot.data!.docs.length - index - 1]
                                .data()["senderID"]) {
                          isMe = false;
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              StyleofMessage(
                                isMe: isMe,
                                ispdf: ispdf,
                                snapshot: snapshot,
                                index: index,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
            // container
            TextofSendMessage(
              chatRoomID: chatRoomID,
              reciveID: widget.reciveID,
            )
          ],
        ),
      ),
    );
  }
}
