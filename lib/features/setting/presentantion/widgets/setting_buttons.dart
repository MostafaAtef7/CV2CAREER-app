import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/features/setting/functions/view_ats.dart';

import 'custom_setting_button.dart';

class SettingButtons extends StatelessWidget {
  const SettingButtons({super.key});

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {
            GoRouter.of(context).push(AppRouter.uploadCV);
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
