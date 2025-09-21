import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../../core/helper/handel_address_form.dart';
import '../../../../../core/helper/handel_pay_with_cash.dart';
import '../../../../../core/helper/paypal_payment_method.dart';
import '../../../domain/entities/order_entity.dart';
import 'checkout_page_view.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        currentPageIndex = _pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
    autovalidateMode.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int currentPageIndex = 0;
  ValueNotifier<AutovalidateMode> autovalidateMode =
      ValueNotifier(AutovalidateMode.disabled);
  @override
  Widget build(BuildContext context) {
    final orderEntity = context.read<OrderEntity>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 32),
          CheckoutSteps(
            onStepTapped: (index) {
              log("current page index= $currentPageIndex");
              if (currentPageIndex == 0) {
                if (orderEntity.payWithCash != null) {
                  _pageController.animateToPage(
                    currentPageIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                  );
                } else {
                  buildErrorSnackBar(
                      context, S.of(context).choosePaymentMethod);
                }
              } else if (index == 1) {
                if (orderEntity.payWithCash != null) {
                  _pageController.animateToPage(
                    currentPageIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                  );
                } else {
                  buildErrorSnackBar(
                      context, S.of(context).choosePaymentMethod);
                }
              } else {
                handeladdressForm(formKey, autovalidateMode.value,
                    _pageController, currentPageIndex);
              }
            },
            pageController: _pageController,
            currentStep: currentPageIndex,
          ),
          Expanded(
            child: CheckOutPageView(
              pageController: _pageController,
              formKey: formKey,
              autoValidateMode: autovalidateMode,
            ),
          ),
          CustomButton(
            onPressed: () {
              if (currentPageIndex == 0) {
                handelpayWithCash(
                    orderEntity, context, currentPageIndex, _pageController);
              } else if (currentPageIndex == 1) {
                handeladdressForm(
                    formKey,
                    autovalidateMode.value,
                    _pageController,
                    currentPageIndex); // bug here that when pressing the button to go to the payment screen it not valid or listen if user enter the shipping address details or not
              } else {
                paymentMethod(orderEntity, context);
              }
            },
            title: getTextPayment(context),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  String getTextPayment(BuildContext context) {
    switch (currentPageIndex) {
      case 0:
        return S.of(context).next;
      case 1:
        return S.of(context).next;
      case 2:
        return S.of(context).payWithPayPal;
      default:
        return S.of(context).next;
    }
  }
}
