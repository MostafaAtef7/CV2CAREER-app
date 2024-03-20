import 'package:flutter/material.dart';
import 'package:gp_app/features/auth/presentation/view/widgets/signup_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                GoRouter.of(context).push(AppRouter.uploadCV);
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
                          AssetsData.registerImage,
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
                            return null;
                          },
                          controller: null,
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
                            return null;
                          },
                          controller: null,
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
                            return null;
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
                            return null;
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
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: CustomButton(
                            text: 'Sign Up ',
                            width: 250,
                            height: 50,
                            onPressed: () {
                              if (signupKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).signUp(
                                    emailAddress: emailAddress!,
                                    password: password!,
                                    userName: userName!,
                                    userType: groupValue!);
                              }
                            },
                          ),
                        ),
                        const SignUpTail()
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
