import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'package:gp_app/features/chat/domain/chat_servises.dart';
import 'package:gp_app/features/chat/presentation/view/widgets/show_pdf.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:file_picker/file_picker.dart';
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
  final TextEditingController _messageController = TextEditingController();
  final Chatservices _chatservices = Chatservices();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late UploadTask uploadTask;

  void sendMessage(bool ispdf) async {
    if (_messageController.text.isNotEmpty) {
      await _chatservices.sendMessage(
          widget.reciveID, _messageController.text, ispdf, "");
      _messageController.clear();
    }
  }

  Future<void> getPathUploaded(String chatRoomID) async {
    FilePickerResult? pickFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickFile != null && pickFile.files.isNotEmpty) {
      File file = File(pickFile.files.first.path!);
      await uploadDataInStorage(file, pickFile, chatRoomID);
      if (kDebugMode) {
        print("********Done**********");
      }
    } else {
      if (kDebugMode) {
        print('No file selected');
      }
    }
  }

  Future<void> uploadDataInStorage(
      File file, FilePickerResult picker, String chatRoomID) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('chatRoom/PDFS/${chatRoomID}/${picker.files.first.name}');

    try {
      if (await file.exists()) {
        if (kDebugMode) {
          print("File exists, uploading..........");
        }
        uploadTask = storageRef.putFile(file);
        final snapshot = await uploadTask.whenComplete(() {});
        final url = await snapshot.ref.getDownloadURL();

        // print('URL : ${URL}');
        if (kDebugMode) {
          print("Upload successful!");
        }

        await _chatservices.sendMessage(
            widget.reciveID, picker.files.first.name, true, url);
      } else {
        if (kDebugMode) {
          print("File does not exist or cannot be accessed.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error uploading file: $e");
      }
    }
  }

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
                  // print('chatRoomID : ${chatRoomID}');
                  // print("Len : ${snapshot.data!.docs.length}");
                  // print('senderID : ${senderID}');
                  // print('reciveID : ${reciveID}');
                  // print('CurrentUser : ${currentUserID}');

                  return Expanded(
                    child: ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        bool isMe = true;
                        // print("before isPDF : ${isPDF}");
                        // if (isPDF) {
                        //   isPDF = false;
                        // }
                        // print("After isPDF : ${isPDF}");
                        //
                        // print("Len : ${snapshot.data!.docs.length}");
                        // print(
                        //     'Index : ${snapshot.data!.docs.length - index - 1}');
                        // print(
                        //     'Real Msg :${snapshot.data!.docs[index].data()["message"]}');
                        if (currentUserID ==
                            snapshot.data!
                                .docs[snapshot.data!.docs.length - index - 1]
                                .data()["senderID"]) {
                          isMe = false;
                          // print('value of isMe in fun ${isMe}');
                        }
                        // print('value of isMe ${isMe}');
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: isMe
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.end,
                                children: [
                                  Material(
                                    borderRadius: snapshot
                                            .data!
                                            .docs[snapshot.data!.docs.length -
                                                index -
                                                1]
                                            .data()["ispdf"]
                                        ? const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            topLeft: Radius.circular(10),
                                          )
                                        : isMe
                                            ? const BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              )
                                            : const BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                                topLeft: Radius.circular(10),
                                              ),
                                    color: isMe ? chatColor : kPrimaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: snapshot
                                              .data!
                                              .docs[snapshot.data!.docs.length -
                                                  index -
                                                  1]
                                              .data()["ispdf"]
                                          ? Text(
                                              "${snapshot.data!.docs[snapshot.data!.docs.length - index - 1].data()["message"]}",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            )
                                          : Text(
                                              "${snapshot.data!.docs[snapshot.data!.docs.length - index - 1].data()["message"]}",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                    ),
                                  ),
                                  snapshot
                                          .data!
                                          .docs[snapshot.data!.docs.length -
                                              index -
                                              1]
                                          .data()["ispdf"]
                                      ? Container(
                                          width: 35,
                                          height: 39,
                                          decoration: const BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: GestureDetector(
                                            onTap: () async {
                                              //call thing
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Showpdf(
                                                    url: snapshot
                                                        .data!
                                                        .docs[snapshot.data!
                                                                .docs.length -
                                                            index -
                                                            1]
                                                        .data()["url"],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: const Icon(
                                              Icons.download_rounded,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              size: 20,
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
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
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      height: 45,
                      decoration: const BoxDecoration(
                        color: chatColor,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: GestureDetector(
                              onTap: () async {
                                //call thing
                                getPathUploaded(chatRoomID);
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: TextField(
                              // autofocus: true,
                              cursorColor: kPrimaryColor,
                              controller: _messageController,
                              decoration: const InputDecoration(
                                hintText: "Type a message",
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.w300),
                                focusedBorder: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.file_upload_outlined,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      sendMessage(false);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
