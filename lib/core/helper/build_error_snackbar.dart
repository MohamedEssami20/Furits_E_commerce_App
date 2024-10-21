import 'package:flutter/material.dart';

void buildErrorSnackBar(BuildContext context, String title) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
      ),
    );
  }