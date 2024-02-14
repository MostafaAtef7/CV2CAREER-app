import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';

class BottomBar extends StatefulWidget {
  final int index;
  final ValueChanged<int> onTap;
  const BottomBar({super.key,required this.index, required this.onTap});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final items = const [
    Icon(Icons.public, color: Colors.white),
    Icon(Icons.edit_document, color: Colors.white),
    Icon(Icons.work, color: Colors.white),
    Icon(Icons.manage_accounts_sharp, color:Colors.white)
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: items,
      index: widget.index,
      onTap: widget.onTap,
      height: 50,
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      color: kPrimaryColor,
    );
  }
}
