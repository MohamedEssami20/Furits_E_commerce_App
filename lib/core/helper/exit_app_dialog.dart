import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/generated/l10n.dart';

void showExitDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.scale,
    title: S.of(context).exitApp,
    desc: S.of(context).areYouSureYouWantToExit,
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      exit(0); // يقفل التطبيق
    },
    btnOkText: S.of(context).ok,
    btnCancelText: S.of(context).cancel,
  ).show();
}
