import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';

void openPdf({required File file, required BuildContext context}) {
    GoRouter.of(context).push(AppRouter.viewCV,extra: file);
  }