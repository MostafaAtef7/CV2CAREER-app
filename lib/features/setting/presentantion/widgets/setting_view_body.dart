import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/widgets/custom_buttom.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF78EA79), Color(0xFF3FC3AE)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.9],
            ),
          ),
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Column(
            children: [
              CustomButton(
                width: 200,
                height: 50,
                onPressed: () =>
                    BlocProvider.of<AuthCubit>(context).signOut(context),
                text: 'Log out',
              ),
              const SizedBox(
                height: 4,
              ),
              CustomButton(
                width: 200,
                height: 50,
                onPressed: () =>
                    BlocProvider.of<AuthCubit>(context).retrieveData(),
                text: 'info',
              ),
            ],
          );
        },
      ),
    );
  }
}
