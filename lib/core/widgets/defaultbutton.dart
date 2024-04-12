import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';

class DefaultButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  const DefaultButton({super.key, required this.text, required this.onPressed});

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  bool isOnce = true;

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 200,
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
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
                    borderRadius: BorderRadius.all(Radius.circular(25)))),
            onPressed: widget.onPressed,
            child:
                Text(widget.text, style: const TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }
}
// showDialog<void>(
//                 context: context,
//                 barrierDismissible: false, // user must tap button!
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               'Alert',
//                               style: TextStyle(fontSize: 17),
//                             ),
//                             GestureDetector(
//                               child: const Icon(
//                                 Icons.close,
//                                 size: 20,
//                               ),
//                               onTap: () {
//                                 Navigator.of(context).pop();
//                               },
//                             )
//                           ],
//                         ),
//                         const Divider(
//                           color: unSelectedColor,
//                           height: 15,
//                         ),
//                       ],
//                     ),
//                     content: const SingleChildScrollView(
//                       child: ListBody(
//                         children: <Widget>[
//                           Text('Your CV will be sent once you click OK'),
//                         ],
//                       ),
//                     ),
//                     actions: <Widget>[
//                       Container(
//                         height: 40,
//                         width: 100,
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(25)),
//                           gradient: LinearGradient(
//                             colors: [kSecondColor, kPrimaryColor],
//                             begin: Alignment.topLeft,
//                             end: Alignment.topRight,
//                             stops: [0.0, 0.9],
//                           ),
//                         ),
//                         child: TextButton(
//                           child: const Text('Apply',
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 255, 255, 255),
//                                   fontSize: 13)),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                             // Send CV to HR
//                             // _______________________________*
//                           },
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               );
            