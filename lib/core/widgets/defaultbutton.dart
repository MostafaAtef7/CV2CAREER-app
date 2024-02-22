import 'package:flutter/material.dart';

class defaultbutton extends StatelessWidget {
  String text;

  defaultbutton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 200,
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
              colors: [Color(0xFF78EA79), Color(0xFF3FC3AE)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.9],
            ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)))),
            onPressed: () {
              // Do Thing
              // Send CV to HR
            },
            child: Text(text, style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
    ;
  }
}
