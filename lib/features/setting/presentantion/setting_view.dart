import 'package:flutter/material.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';

import 'widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(children: [
        CustomAppBar(
          paddingHorizontal: 20,
          paddingVertical: 10,
          widget: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Settings & Privacy",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ),
        SettingViewBody(),
      ]);
  }
}
