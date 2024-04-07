import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';
import 'package:gp_app/features/Notification/presentation/view/notification_view.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'package:gp_app/features/home/presentation/view/home_view.dart';
import 'package:gp_app/features/hr_home/presentation/view/hr_home_view.dart';
import 'package:gp_app/features/setting/presentantion/widgets/setting_view_body.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var _currentIndex = 0;
  late String userType;
  late Future<bool> isHR;
  List<Widget> screens = [
    const HomeView(),
    const NotificationView(),
    const SettingViewBody(),
  ];

  // void retrieveData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   userType = sharedPreferences.getString('userType')!;
  //   setState(() {
  //     userType = userType;
  //     screens = [
  //       userType == "HR" ? const HrHomeView() : const HomeView(),
  //       const NotificationView(),
  //       const SettingViewBody(),
  //     ];
  //   });
  // }

  // checkHR() async {
  //   Future<bool> val;
  //   String senderID = BlocProvider.of<AuthCubit>(context).getCurrentuser()!.uid;
  //   val = BlocProvider.of<AuthCubit>(context).checkUserIsHR(senderID);

  //   return val;
  // }

  @override
  void initState() {
    // retrieveData();
    // checkHR();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("*********************$isHR");
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
