import 'package:flutter/material.dart';

void buildSuccessAndErrorSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      content: Text(title),
    ),
  );
}
