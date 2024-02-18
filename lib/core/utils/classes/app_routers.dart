import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'package:gp_app/features/auth/presentation/view/login.dart';
import 'package:gp_app/features/auth/presentation/view/signup.dart';
import 'package:gp_app/features/job_view_details/presentation/view/job_view_details.dart';
import 'package:gp_app/features/onboarding/presentation/view/onboarding.dart';
import 'package:gp_app/features/setting/presentantion/setting_view.dart';
import 'package:gp_app/features/splash/presentation/view/splash_view.dart';

import '../../../features/home/presentation/view/home_view.dart';

abstract class AppRouter {
  static const String homeView = "/homeView";
  static const String jobViewDetails = "/jobViewDetails";
  static const String onboarding = "/onboarding";
  static const String login = "/login";
  static const String signup = "/signuo";
  static const String setting = "/setting";

  static final router = GoRouter(
    routes: [
      GoRoute(
        // default openning page
        path: "/",
        builder: (ctx, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: jobViewDetails,
        builder: (ctx, state) => const JobViewDetails(),
      ),
      GoRoute(
        path: onboarding,
        builder: (ctx, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: login,
        builder: (ctx, state) => const LoginPage(),
      ),
      GoRoute(
        path: signup,
        builder: (ctx, state) => const SignUpPage(),
      ),
      GoRoute(
        path: setting,
        builder: (ctx, state) => const Setting(),
      )
    ],
  );
}
