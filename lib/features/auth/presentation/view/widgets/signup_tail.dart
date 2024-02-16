import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';

class SignUpTail extends StatelessWidget {
  const SignUpTail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account ? ',
            style: TextStyle(
              color: Colors.black,
              // fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.login);
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
