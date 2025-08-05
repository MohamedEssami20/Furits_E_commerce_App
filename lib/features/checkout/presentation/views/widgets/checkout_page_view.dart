import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_section.dart';

import 'address_input_section.dart';

class CheckOutPageView extends StatelessWidget {
  const CheckOutPageView({
    super.key,
    required PageController pageController,
    required this.formKey, required this.autoValidateMode,
  }) : _pageController = pageController;

  final PageController _pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> autoValidateMode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return getStepsView()[index];
        },
        itemCount: getStepsView().length,
      ),
    );
  }

  List<Widget> getStepsView() => [
        const ShippingSection(),
        AddressInputSection(
          formKey: formKey,
          autoValidateMode: autoValidateMode,
        ),
        const PaymentSection(),
      ];
}
