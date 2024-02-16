import 'package:flutter/material.dart';
import 'package:gp_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:gp_app/features/setting/presentantion/setting_view.dart';

Widget selectPageFromBottomBar({index = 0}) {
  Widget widget;

  switch (index) {
    case 0:
      widget = const HomeViewBody();
      break;
    case 1:
      widget = const Placeholder();
      break;
    case 2:
      widget = const Placeholder();
      break;
    default:
      widget = const Setting();
  }
  return widget;
}
