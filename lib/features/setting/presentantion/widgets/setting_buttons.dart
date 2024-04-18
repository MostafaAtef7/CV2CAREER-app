import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'custom_setting_button.dart';

class SettingButtons extends StatefulWidget {
  const SettingButtons({super.key});

  @override
  State<SettingButtons> createState() => _SettingButtonsState();
}

class _SettingButtonsState extends State<SettingButtons> {
  String checkHR = "";

  Future<void> getCheckHR() async {
    String email = FirebaseAuth.instance.currentUser!.email!;
    await BlocProvider.of<AuthCubit>(context).check(emailAddress: email);
    checkHR = BlocProvider.of<AuthCubit>(context).checkHR!;
    print("checkHR :::: $checkHR");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: getCheckHR(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for getCheckHR() to complete
          return const CircularProgressIndicator();
        } else {
          // Once getCheckHR() completes, build the UI based on the result
          return Column(
            children: [
              CustomSettingButton(
                text: 'Edit Profile',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.editProfile);
                },
                icon: Icons.person,
              ),
              const SizedBox(
                height: 15,
              ),
              checkHR == "HR"
                  ? const SizedBox.shrink()
                  : CustomSettingButton(
                      text: 'Change Your CV',
                      onPressed: () async {
                        GoRouter.of(context)
                            .push(AppRouter.uploadCV, extra: checkHR);
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
                icon: Icons.notifications,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        }
      },
    );
  }
}
