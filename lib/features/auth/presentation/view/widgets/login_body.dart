import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/utils/functions/show_quick_alert.dart';
import 'package:gp_app/features/auth/presentation/view/widgets/login_list_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/models/quickalert_type.dart';
import '../../manager/auth_cubits/auth_cubit.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          GoRouter.of(context).push(AppRouter.bottomBar);
          isLoading = false;
        } else if (state is LoginFailure) {
          showQuickAlert(
              context: context,
              quickAlertType: QuickAlertType.error,
              text: state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              color: kPrimaryColor,
            ),
            inAsyncCall: isLoading,
            child: const Padding(
              padding: EdgeInsets.only(top: 16),
              child: LoginListView(),
            ),
          ),
        );
      },
    );
  }
}
