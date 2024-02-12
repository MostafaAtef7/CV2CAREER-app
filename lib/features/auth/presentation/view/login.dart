import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/models/quickalert_type.dart';

import '../../../../constants.dart';
import '../manager/cubits/auth_cubit/auth_cubit.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/show_quick_alert.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  String? emailAddress;
  String? password;
  GlobalKey<FormState> loginKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          showQuickAlert(
              context: context,
              quickAlertType: QuickAlertType.success,
              onConfirmBtnTap: () {
                GoRouter.of(context).push(AppRouter.homeView);
              },
              text: 'Logined Successfully !');
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
            inAsyncCall: isLoading,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Form(
                key: loginKey,
                child: ListView(children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/login.png',
                        height: 250,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const CustomText(text: 'Email'),
                      CustomTextFormField(
                        onSumbitted: (value) {
                          emailAddress = value;
                        },
                        onChanged: (value) {
                          emailAddress = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field is required';
                          }
                          if (!RegExp("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Invalid Email';
                          }
                        },
                        hintText: 'Your email address',
                        suffixIcon: const Icon(Icons.mail),
                      ),
                      const CustomText(text: 'Password'),
                      CustomTextFormField(
                        onSumbitted: (value) {
                          password = value;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field is required';
                          }
                        },
                        hintText: '**********',
                        suffixIcon: const Icon(Icons.lock),
                      ),
                      CustomButton(
                        text: 'Login',
                        onTap: () {
                          if (loginKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).login(
                                emailAddress: emailAddress!,
                                password: password!);
                          }
                        },
                      ),
                      Row(
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
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
