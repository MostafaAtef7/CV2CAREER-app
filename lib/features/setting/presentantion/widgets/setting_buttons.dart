import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'package:gp_app/features/setting/functions/view_ats.dart';

import 'custom_setting_button.dart';

class SettingButtons extends StatelessWidget {
  const SettingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    Future<String> getCheckHR({required String email}) async {
      await BlocProvider.of<AuthCubit>(context).check(emailAddress: email);
      return BlocProvider.of<AuthCubit>(context).checkHR!;
    }

    return Column(
      children: [
        CustomSettingButton(
            text: 'Edit Profile',
            onPressed: () {
              GoRouter.of(context).push(AppRouter.editProfile);
            },
            icon: Icons.person),
        const SizedBox(
          height: 15,
        ),
        CustomSettingButton(
          text: 'Change Your CV',
          onPressed: () async {
            String checkHR;
            String email = FirebaseAuth.instance.currentUser!.email!;
            checkHR = await getCheckHR(email: email);
            GoRouter.of(context).push(AppRouter.uploadCV, extra: checkHR);
          },
          icon: FontAwesomeIcons.arrowUpFromBracket,
          iconSize: 18,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomSettingButton(
            text: 'Notifications',
            onPressed: () {
              // GoRouter.of(context).push('/notifications');
            },
            icon: Icons.notifications),
        const SizedBox(
          height: 15,
        ),
        CustomSettingButton(
            text: 'ATS Friendly Format',
            onPressed: () => viewATS(context),
            icon: Icons.file_open),
      ],
    );
  }
}
