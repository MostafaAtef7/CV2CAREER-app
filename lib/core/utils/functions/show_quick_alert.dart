import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../../../constants.dart';

void showQuickAlert(
    {required BuildContext context,
    required QuickAlertType quickAlertType,
    required String text,
    Function()? onConfirmBtnTap}) {
  if (quickAlertType == QuickAlertType.error) {
    QuickAlert.show(
        context: context,
        type: quickAlertType,
        text: text,
        confirmBtnColor: Colors.red,
        confirmBtnText: 'Ok');
  } else {
    QuickAlert.show(
        context: context,
        type: quickAlertType,
        text: text,
        confirmBtnColor: kPrimaryColor,
        confirmBtnText: 'Ok',
        onConfirmBtnTap: onConfirmBtnTap);
  }
}
