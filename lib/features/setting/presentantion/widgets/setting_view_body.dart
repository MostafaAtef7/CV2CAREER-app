import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'package:gp_app/features/setting/presentantion/widgets/custom_logout_button.dart';
import 'package:gp_app/features/setting/presentantion/widgets/modes.dart';
import 'setting_buttons.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  String checkHR = "";

  Future<void> getCheckHR() async {
    String email = FirebaseAuth.instance.currentUser!.email!;
    await BlocProvider.of<AuthCubit>(context).check(emailAddress: email);
    checkHR = BlocProvider.of<AuthCubit>(context).checkHR!;
    // print("checkHR :::: ${checkHR}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCheckHR();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: getCheckHR(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for getCheckHR() to complete
          return CircularProgressIndicator();
        } else {
          // Once getCheckHR() completes, build the UI based on the result
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 80,
                left: 35,
                child: Container(
                  height: 440,
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
                    child: Padding(
                      padding: checkHR == "HR"
                          ? const EdgeInsets.only(top: 65, right: 29, left: 23)
                          : const EdgeInsets.only(top: 35, right: 29, left: 23),
                      child: const Column(
                        children: [
                          SettingButtons(),
                          SizedBox(
                            height: 30,
                          ),
                          Modes(),
                          SizedBox(
                            height: 40,
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
      },
    );
  }
}
