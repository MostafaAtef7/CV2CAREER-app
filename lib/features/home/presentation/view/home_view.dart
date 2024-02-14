import 'package:flutter/material.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';

import '../../../../core/utils/functions/bottom_bar_select_page.dart';
import '../../../../core/widgets/bottom_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          iconButton: null,
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
