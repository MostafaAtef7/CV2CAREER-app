import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/widgets/custom_buttom.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return CustomButton(
        width: 200,
        height: 50,
        onPressed: () => BlocProvider.of<AuthCubit>(context).signOut(context),
        text: 'Log out',
      );
    });
  }
}
