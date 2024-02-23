import 'package:flutter/material.dart';

class text extends StatelessWidget {
  String txt;
  FontWeight fontW;

  text({required this.txt, required this.fontW});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(fontWeight: fontW),
    );
  }
}
