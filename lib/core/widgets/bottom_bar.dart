import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/features/home/presentation/view/home_view.dart';
import 'package:gp_app/features/home/presentation/view/widgets/ats_format.dart';
import 'package:gp_app/features/hr_cv_filteration/presentation/view/hr_cv_filteration_view.dart.dart';
import 'package:gp_app/features/hr_home/presentation/view/hr_home_view.dart';
import 'package:gp_app/features/setting/presentantion/setting_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key, required this.checkHR});
  final String checkHR;
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var _currentIndex = 0;
  List<Widget> hrScreens = [
    const HrHomeView(),
    // const NotificationView(),
    const HrCvFilterationView(),
    const SettingView(),
  ];
  List<Widget> userScreens = [
    const HomeView(),
    // const NotificationView(),
    const AtsFormat(),
    const SettingView(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("${widget.checkHR}*********************");
    return Scaffold(
      body: widget.checkHR == "HR"
          ? hrScreens[_currentIndex]
          : userScreens[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF78EA79), Color(0xFF3FC3AE)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 0.9],
          ),
        ),
        child: SalomonBottomBar(
          selectedColorOpacity: 0.3,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_bag),
              title: const Text(''),
              selectedColor: Colors.white,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.document_scanner),
              title: const Text(""),
              selectedColor: Colors.white,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.settings),
              title: const Text(""),
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
