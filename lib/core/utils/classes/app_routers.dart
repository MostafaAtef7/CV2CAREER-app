import 'package:go_router/go_router.dart';
import 'package:gp_app/features/job_view_details/presentation/view/job_view_details.dart';
import 'package:gp_app/features/splash/presentation/view/splash_view.dart';

import '../../../features/home/presentation/view/home_view.dart';

abstract class AppRouter {
  static const String homeView = "/homeView";
  static const String jobViewDetails = "/jobViewDetails";

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
    ],
  );
}
