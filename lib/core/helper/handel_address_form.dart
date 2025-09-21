import 'package:flutter/material.dart';

void handeladdressForm(
    GlobalKey<FormState> formKey,
    AutovalidateMode autovalidateMode,
    PageController pageController,
    int currentPageIndex) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    pageController.animateToPage(
      currentPageIndex + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  } else {
    autovalidateMode = AutovalidateMode.always;
  }
}
