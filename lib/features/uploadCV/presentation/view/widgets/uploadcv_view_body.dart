import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/utils/classes/assets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class UploadCvViewBody extends StatefulWidget {
  const UploadCvViewBody({super.key});

  @override
  State<UploadCvViewBody> createState() => UploadCvState();
}

var isClick = 0;
var isFinished = false;

class UploadCvState extends State<UploadCvViewBody> {
  uploadCV() async {
    // Allow the user to pick a file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );

    if (result != null) {
      setState(() {
        isClick = 1;
      });
      // Get the file path
      String filePath = result.files.single.path!;

      // Replace 'YOUR_API_ENDPOINT' with the actual endpoint URL

      // var url = Uri.parse("http://192.168.1.9:5000/upload");
      var url = Uri.parse("");
      // Create a multipart request
      var request = http.MultipartRequest('POST', url);

      // Add the file to the request
      var multipartFile = await http.MultipartFile.fromPath(
        'file',
        filePath,
        contentType: MediaType(
            'application', 'octet-stream'), // Adjust content type if needed
      );

      request.files.add(multipartFile);

      //_______________________ Test
      Future.delayed(const Duration(seconds: 7), () {
        setState(
          () {
            isClick = 2; // Set success state
          },
        );
      });

      //_______________________

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        // File uploaded successfully
        var responseBody = await response.stream.bytesToString();

        print(responseBody); // Print the response from the server

        setState(() {
          isClick = 2; // Set success state
        });
      } else {
        // Error uploading file
        print('Failed to upload file');
        setState(() {
          isClick = 0; // Reset button state
        });
      }
    } else {
      // User canceled the file picking
      print('No file selected.');
      print("*********************");
    }

    // setState(() {
    //   isClick = 2;
    // });
    // print(isClick);
    // print("_________________");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Image.asset(
                  AssetsData.uploadCVImage,
                  width: 200,
                ),
                const Text("Upload Your CV",
                    style: TextStyle(fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              if (isClick == 0)
                Column(
                  children: [
                    const SizedBox(height: 40),
                    SizedBox(
                        height: 80,
                        width: 270,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 250,
                                  margin: const EdgeInsets.only(top: 20),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    gradient: LinearGradient(
                                      colors: [kSecondColor, kPrimaryColor],
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      stops: [0.0, 0.9],
                                    ),
                                  ),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        uploadCV();
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.drive_folder_upload,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Select CV To Upload",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                )
              else if (isClick == 1)
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Center(
                      child: LoadingAnimationWidget.inkDrop(
                        size: 30,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                )
              else if (isClick == 2)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 90,
                    left: 70,
                    right: 70,
                  ),
                  child: SwipeableButtonView(
                    disableColor: kPrimaryColor,
                    buttonText: 'Continue',
                    buttonWidget: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                    activeColor: const Color(0xFF3FC3AE),
                    isFinished: isFinished,
                    onWaitingProcess: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isFinished = true;
                        });
                      });
                    },
                    onFinish: () async {
                      GoRouter.of(context).push(AppRouter.bottomBar);
                      setState(() {
                        isFinished = false;
                      });
                    },
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
