import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/features/chat/domain/chat_servises.dart';

class TextofSendMessage extends StatefulWidget {
  final String chatRoomID;
  final String reciveID;
  const TextofSendMessage(
      {super.key, required this.chatRoomID, required this.reciveID});

  @override
  State<TextofSendMessage> createState() => _TextofSendMessageState();
}

class _TextofSendMessageState extends State<TextofSendMessage> {
  final TextEditingController _messageController = TextEditingController();
  final Chatservices _chatservices = Chatservices();
  late UploadTask uploadTask;

  void sendMessage(bool ispdf) async {
    if (_messageController.text.isNotEmpty) {
      await _chatservices.sendMessage(
          widget.reciveID, _messageController.text, ispdf, "");
      _messageController.clear();
    }
  }

  Future<void> getPathUploaded(chatRoomID) async {
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
        .child('ChatRomm/PDFs/$chatRoomID/${picker.files.first.name}');

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
    return Container(
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
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: GestureDetector(
                      onTap: () async {
                        //call thing
                        getPathUploaded(widget.chatRoomID);
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
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
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
    );
  }
}
