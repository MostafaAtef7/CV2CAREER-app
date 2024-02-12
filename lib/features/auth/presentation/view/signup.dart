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

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});
  static String id = 'signup';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? userName;

  String? emailAddress;

  String? password;

  String? confirmPassword;

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  String? userType;

  String? groupValue = 'HR';

  bool isLoading = false;

  GlobalKey<FormState> signupKey = GlobalKey();

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
                GoRouter.of(context).push(AppRouter.homeView);
              },
              text: 'Registered Successfully !');

          isLoading = false;
          GoRouter.of(context).push(AppRouter.homeView);
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
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Form(
                key: signupKey,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/signup.png',
                          height: 150,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const CustomText(text: 'User Name'),
                        CustomTextFormField(
                          hintText: 'Your Name ',
                          suffixIcon: const Icon(Icons.person),
                          onSumbitted: (value) {
                            userName = value;
                          },
                          onChanged: (value) {
                            userName = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is required';
                            }
                          },
                        ),
                        const CustomText(text: 'Email'),
                        CustomTextFormField(
                          hintText: 'Your Email Address',
                          suffixIcon: const Icon(Icons.mail),
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
                        ),
                        const CustomText(text: 'Password'),
                        CustomTextFormField(
                          controller: passwordController,
                          hintText: '********',
                          suffixIcon: const Icon(Icons.lock),
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
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                          },
                        ),
                        const CustomText(text: 'Confirm Password'),
                        CustomTextFormField(
                          controller: confirmPasswordController,
                          hintText: '********',
                          suffixIcon: const Icon(Icons.lock),
                          onSumbitted: (value) {
                            confirmPassword = value;
                          },
                          onChanged: (value) {
                            confirmPassword = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is required';
                            }

                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              return 'Password doesn\'t match';
                            }
                          },
                        ),
                        Row(
                          children: [
                            const CustomText(text: 'Type'),
                            Radio(
                              value: 'HR',
                              activeColor: kPrimaryColor,
                              groupValue: groupValue,
                              onChanged: (value) {
                                groupValue = value;
                                setState(() {});
                              },
                            ),
                            const Text('HR'),
                            const SizedBox(
                              width: 5,
                            ),
                            Radio(
                              value: 'Job Seeker',
                              activeColor: kPrimaryColor,
                              groupValue: groupValue,
                              onChanged: (value) {
                                groupValue = value;
                                setState(() {});
                              },
                            ),
                            const Text('Job Seeker'),
                          ],
                        ),
                        CustomButton(
                          text: 'Sign Up ',
                          onTap: () {
                            if (signupKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).signUp(
                                emailAddress: emailAddress!,
                                password: password!,
                              );
                            }
                          },
                        ),
                        Row(
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
