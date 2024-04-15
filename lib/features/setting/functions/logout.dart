import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/presentation/manager/auth_cubits/auth_cubit.dart';

void logout(BuildContext context) {
  BlocProvider.of<AuthCubit>(context).signOut(context);
}
