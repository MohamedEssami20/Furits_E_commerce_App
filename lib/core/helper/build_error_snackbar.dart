import 'package:flutter/material.dart';

void buildErrorSnackBar(BuildContext context, String title) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        content: Text(title),
      ),
    );
  }