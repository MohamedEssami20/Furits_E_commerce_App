import 'package:flutter/material.dart';

abstract class AppDecoration {
  static  ShapeDecoration greyBoxDecoration = ShapeDecoration(
    color: const Color(0x7FF2F3F3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
