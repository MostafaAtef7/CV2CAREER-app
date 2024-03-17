import 'package:flutter/material.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';
import 'package:gp_app/features/home/presentation/view/home_view.dart';
import 'package:gp_app/features/setting/presentantion/widgets/setting_view_body.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> screens = [
    const HomeView(),
    const SizedBox(height: 10, width: 10),
    const SettingViewBody(),
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomAppBar(
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hi, Mostafa",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: "Inter",
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.supervised_user_circle,
                      color: Colors.white))
            ],
          ),
        ),
        screens[_currentIndex],
      ]),
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
