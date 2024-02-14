import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/widgets/custom_buttom.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: 200,
      height: 50,
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        if (context.mounted) {
          while (context.canPop()) {
            GoRouter.of(context).pop();
          }
          GoRouter.of(context).pushReplacement(AppRouter.login);
        }
      },
      text: 'Log out',
    );
  }
}
