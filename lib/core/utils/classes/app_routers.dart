import 'package:go_router/go_router.dart';
import 'package:gp_app/features/splash/presentation/view/splash_view.dart';

import '../../../features/home/presentation/view/home_view.dart';

abstract class AppRouter {
  static const String homeView = "/homeView";

  static final router = GoRouter(routes: [
    GoRoute(
      // default openning page
      path: "/",
      builder: (ctx, state) => const SplashView(),
    ),
 
    GoRoute(
      path: homeView,
      builder:(context, state) => const HomeView(),
    ),
  ],
  );
}
