import 'package:flutter/material.dart';
import 'package:gp_app/features/Notification/presentation/view/notification_view.dart';
import 'package:gp_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:gp_app/features/setting/presentantion/setting_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> screens = [
    const HomeViewBody(),
    const NotificationView(),
    const Setting(),
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
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
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_bag),
              title: const Text(''),
              selectedColor: Colors.white,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.notifications),
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
