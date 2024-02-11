import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigatToHomeView();
    super.initState();
  }

  void navigatToHomeView() {
    Future.delayed(const Duration(seconds: 5), () {
      GoRouter.of(context).push(AppRouter.homeView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              "CV2CAREER",
              textStyle: const TextStyle(
                fontSize: 25,
                color: kPrimaryColor,
                fontFamily: "Rubik",
              ),
              speed: const Duration(milliseconds: 300),
            ),
          ],
          isRepeatingAnimation: false,
        ),
      ),
    );
  }
}
