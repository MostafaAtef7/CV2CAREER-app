import 'package:flutter/material.dart';
import 'package:gp_app/features/setting/presentantion/widgets/custom_logout_button.dart';
import 'package:gp_app/features/setting/presentantion/widgets/modes.dart';
import 'setting_buttons.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 80,
          left: 35,
          child: Container(
            height: 470,
            width: 298,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 18,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Card(
              color: Theme.of(context).colorScheme.primary,
              elevation: 1,
              child: const Padding(
                padding: EdgeInsets.only(top: 30, right: 29, left: 23),
                child: Column(
                  children: [
                    SettingButtons(),
                    SizedBox(
                      height: 30,
                    ),
                    Modes(),
                    SizedBox(
                      height: 30,
                    ),
                    CustomLogOutButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
