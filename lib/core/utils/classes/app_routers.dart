import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';
import 'package:gp_app/core/widgets/bottom_bar.dart';
import 'package:gp_app/features/add_job/presentation/view/add_job_view.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'package:gp_app/features/auth/presentation/view/login.dart';
import 'package:gp_app/features/auth/presentation/view/signup.dart';
import 'package:gp_app/features/cv_view/presentation/view/cv_view.dart';
import 'package:gp_app/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:gp_app/features/github/presentation/view/github_view.dart';
import 'package:gp_app/features/job_description/presentation/view/job_descrption_view.dart';
import 'package:gp_app/features/home/presentation/view/home_view.dart';
import 'package:gp_app/features/onboarding/presentation/view/onboarding.dart';
import 'package:gp_app/features/see_all_general_job/presentation/view/see_all_general_job_view.dart';
import 'package:gp_app/features/setting/presentantion/widgets/setting_view_body.dart';
import 'package:gp_app/features/splash/presentation/view/splash_view.dart';
import 'package:gp_app/features/tempales/presentation/view/template_view.dart';
import 'package:gp_app/features/uploadCV/presentation/view/uploadcv_view.dart';

abstract class AppRouter {
  static const String homeView = "/homeView";
  static const String jobDescription = "/jobDescription";
  static const String onboarding = "/onboarding";
  static const String login = "/login";
  static const String signup = "/signuo";
  static const String setting = "/setting";
  static const String bottomBar = "/BottomBar";
  static const String uploadCV = "/uploadcv_View";
  static const String viewCV = "/viewCV";
  static const String seeAllGeneralJob = "/seeAllGeneralJob";
  static const String addJob = "/AddJobView";
  static const String editProfile = "/editProfile";
  static const String githubView = "/GithubView";

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
        path: jobDescription,
        builder: (ctx, state) =>
            JobDescriptionView(job: state.extra as JobsModel),
      ),
      GoRoute(
        path: onboarding,
        builder: (ctx, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: login,
        builder: (ctx, state) => BlocProvider(
            create: (context) => AuthCubit(), child: const LoginPage()),
      ),
      GoRoute(
        path: signup,
        builder: (ctx, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignUpPage(),
        ),
      ),
      GoRoute(
        path: setting,
        builder: (ctx, state) => const SettingViewBody(),
      ),
      GoRoute(
        path: bottomBar,
        builder: (ctx, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: BottomBar(
            checkHR: state.extra as String,
          ),
        ),
      ),
      GoRoute(
        path: uploadCV,
        builder: (ctx, state) => UploadCvView(checkHR: state.extra as String),
      ),
      GoRoute(
        path: githubView,
        builder: (ctx, state) => GithubView(checkHR: state.extra as String),
      ),
      GoRoute(
        path: viewCV,
        builder: (ctx, state) => CvView(
          file: state.extra as File,
        ),
      ),
      GoRoute(
        path: seeAllGeneralJob,
        builder: (ctx, state) =>
            SeeAllGeneralJobView(jobs: state.extra as List<JobsModel>),
      ),
      GoRoute(
        path: addJob,
        builder: (ctx, state) => const AddJobView(),
      ),
      GoRoute(
        path: editProfile,
        builder: (ctx, state) => const EditProfileView(),
      ),
    ],
  );
}
