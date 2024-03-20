import 'package:flutter/material.dart';
import 'package:gp_app/core/utils/classes/assets.dart';
import 'package:gp_app/features/auth/presentation/view/widgets/signup_tail.dart';
import 'package:gp_app/features/auth/presentation/view/widgets/signup_validate_user_info.dart';

class SignUpListView extends StatelessWidget {
  const SignUpListView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signupKey = GlobalKey();
    return Form(
      key: signupKey,
      child: ListView(
        children: [
          Column(
            children: [
              Image.asset(
                AssetsData.registerImage,
                height: 150,
              ),
              const SizedBox(
                height: 5,
              ),
              SignUpValidateUserInfo(
                signupKey: signupKey,
              ),
              const SignUpTail()
            ],
          )
        ],
      ),
    );
  }
}
