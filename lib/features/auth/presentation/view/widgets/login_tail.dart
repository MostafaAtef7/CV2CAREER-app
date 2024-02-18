import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';

import '../../../../../constants.dart';

class LoginTail extends StatelessWidget {
  const LoginTail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'don\'t have an account ? ',
          style: TextStyle(
            color: Colors.black,
            // fontSize: 16,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.signup);
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
