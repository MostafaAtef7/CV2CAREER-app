import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/constants.dart';

import '../../../../../core/utils/classes/assets.dart';
import '../../../../../core/widgets/custom_buttom.dart';
import '../../manager/auth_cubits/auth_cubit.dart';
import 'custom_text.dart';
import 'custom_text_form_field.dart';
import 'login_tail.dart';

class LoginListView extends StatefulWidget {
  const LoginListView({super.key});

  @override
  State<LoginListView> createState() => _LoginListViewState();
}

class _LoginListViewState extends State<LoginListView> {
  String? emailAddress;
  String? password;

  GlobalKey<FormState> loginKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginKey,
      child: ListView(
        children: [
          Column(
            children: [
              Image.asset(
                AssetsData.loginImage,
                height: 250,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                // color: Colors.amber,
                child: Column(
                  children: [
                    const CustomText(text: 'Email'),
                    CustomTextFormField(
                      isPassword: false,
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
                      suffixIcon: const Icon(
                        Icons.mail,
                        color: kPrimaryColor,
                      ),
                      controller: null,
                    ),
                    const CustomText(text: 'Password'),
                    CustomTextFormField(
                      isPassword: true,
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
                      suffixIcon: const Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                      controller: null,
                    ),
                  ],
                ),
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
                          emailAddress: emailAddress!, password: password!);
                    }
                  },
                ),
              ),
              const LoginTail()
            ],
          ),
        ],
      ),
    );
  }
}
