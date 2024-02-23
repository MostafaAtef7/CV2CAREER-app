import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/utils/classes/assets.dart';
import 'package:shimmer/shimmer.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _splashScreenState();
}

class _splashScreenState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      FirebaseAuth.instance.currentUser == null
          ? GoRouter.of(context).pushReplacement(AppRouter.onboarding)
          : GoRouter.of(context).pushReplacement(AppRouter.bottomBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              AssetsData.splashImage,
              width: 200,
            ),
          ),
          Shimmer.fromColors(
            baseColor: Color.fromARGB(179, 255, 255, 255),
            highlightColor: Color(0xff3FC3AE),
            child: Text(
              "LOADING ....",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
