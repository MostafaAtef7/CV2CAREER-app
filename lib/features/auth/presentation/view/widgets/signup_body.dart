import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/utils/functions/show_quick_alert.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'package:gp_app/features/auth/presentation/view/widgets/signup_list_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/models/quickalert_type.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  bool isLoading = false;

  GlobalKey<FormState> signupKey = GlobalKey();
  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          showQuickAlert(
              context: context,
              quickAlertType: QuickAlertType.success,
              onConfirmBtnTap: () {
                if (state.checkHR != "HR") {
                  print(state.checkHR + "*********************");
                  GoRouter.of(context).push(AppRouter.uploadCV, extra: state.checkHR);
                } else {
                  GoRouter.of(context)
                      .push(AppRouter.bottomBar, extra: state.checkHR);
                }
              },
              text: 'Registered Successfully !');

          isLoading = false;
        } else if (state is RegisterFailure) {
          showQuickAlert(
              context: context,
              quickAlertType: QuickAlertType.error,
              text: state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: const Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 16),
              child: SignUpListView(),
            ),
          ),
        );
      },
    );
  }
}
