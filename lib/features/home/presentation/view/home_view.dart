import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';

import 'functions/bottom_bar_select_page.dart';
import 'widgets/bottom_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 2,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "CV2CAREER",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Rubix"),
          ),
        ),
        bottomNavigationBar: BottomBar(
          index: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ),
        body: selectPageFromBottomBar(index: index),
      ),
    );
  }
}
