import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/features/setting/manager/theme_cubit/theme_cubit.dart';

import 'custom_mode.dart';

class Modes extends StatelessWidget {
  const Modes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 19),
        child: Row(
          children: [
            CustomMode(
                onPressed: () =>
                    BlocProvider.of<ThemeCubit>(context).changeThemetoLight(),
                backgroundColor: Colors.white,
                textColor: Colors.black,
                text: 'Light Mode',
                iconColor: Colors.black,
                iconData: Icons.light_mode),
            const SizedBox(
              width: 39,
            ),
            CustomMode(
                onPressed: () =>
                    BlocProvider.of<ThemeCubit>(context).changeThemetoDark(),
                backgroundColor: Colors.black,
                textColor: Colors.white,
                text: 'Dark Mode',
                iconColor: Colors.white,
                iconData: Icons.dark_mode),
          ],
        ));
  }
}
