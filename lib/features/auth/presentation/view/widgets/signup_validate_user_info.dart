import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/widgets/custom_buttom.dart';

import '../../manager/auth_cubits/auth_cubit.dart';
import 'custom_radio_button.dart';
import 'custom_text.dart';
import 'custom_text_form_field.dart';

class SignUpValidateUserInfo extends StatefulWidget {
  const SignUpValidateUserInfo({super.key, required this.signupKey});
  final GlobalKey<FormState> signupKey;
  @override
  State<SignUpValidateUserInfo> createState() => _SignUpValidateUserInfoState();
}

class _SignUpValidateUserInfoState extends State<SignUpValidateUserInfo> {
  String? userName;

  String? emailAddress;

  String? password;

  String? confirmPassword;

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  String? userType;

  String? groupValue = 'HR';

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            children: [
              const CustomText(text: 'User Name'),
              CustomTextFormField(
                isPassword: false,
                hintText: 'Your Name ',
                suffixIcon: const Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
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
                  return null;
                },
                controller: null,
              ),
              const CustomText(text: 'Email'),
              CustomTextFormField(
                isPassword: false,
                hintText: 'Your Email Address',
                suffixIcon: const Icon(
                  Icons.mail,
                  color: kPrimaryColor,
                ),
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
                controller: null,
              ),
              const CustomText(text: 'Password'),
              CustomTextFormField(
                isPassword: true,
                controller: passwordController,
                hintText: '********',
                suffixIcon: const Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
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
                  return null;
                },
              ),
              const CustomText(text: 'Confirm Password'),
              CustomTextFormField(
                isPassword: true,
                controller: confirmPasswordController,
                hintText: '********',
                suffixIcon: const Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
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
                  return null;
                },
              ),
              const CustomRadioButton(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: CustomButton(
            text: 'Sign Up ',
            width: 250,
            height: 50,
            onPressed: () {
              if (widget.signupKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).signUp(
                    emailAddress: emailAddress!,
                    password: password!,
                    userName: userName!,
                    userType: CustomRadioButton.groupValue!);
              }
            },
          ),
        ),
      ],
    );
  }
}
