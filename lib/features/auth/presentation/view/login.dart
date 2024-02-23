import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/utils/classes/assets.dart';
import 'package:gp_app/core/widgets/custom_buttom.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/models/quickalert_type.dart';

import '../../../../constants.dart';

import '../manager/auth_cubits/auth_cubit.dart';
import 'widgets/custom_text.dart';
import 'widgets/custom_text_form_field.dart';
import '../../../../core/utils/functions/show_quick_alert.dart';
import 'widgets/login_tail.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Form(
                key: loginKey,
                child: ListView(children: [
                  Column(
                    children: [
                      Image.asset(
                        AssetsData.loginImage,
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
                          return null;
                        },
                        hintText: 'Your email address',
                        suffixIcon: const Icon(Icons.mail),
                        controller: null,
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
                          return null;
                        },
                        hintText: '**********',
                        suffixIcon: const Icon(Icons.lock),
                        controller: null,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: CustomButton(
                          text: 'Login',
                          width: 250,
                          height: 50,
                          onPressed: () {
                            if (loginKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).login(
                                  emailAddress: emailAddress!,
                                  password: password!);
                            }
                          },
                        ),
                      ),
                      const LoginTail()
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
