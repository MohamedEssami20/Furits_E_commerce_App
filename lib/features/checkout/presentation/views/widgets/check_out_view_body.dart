import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_hub/core/helper/app_keys.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/domain/entities/payPal_payment_entities/pay_pal_payment_entity/pay_pal_payment_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';

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
                _handelpayWithCash(orderEntity, context);
              } else if (currentPageIndex == 1) {
                _handeladdressForm(formKey);
              } else {
                _paymentMethod(orderEntity);
              }
            },
            title: getTextPayment(),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  void _handelpayWithCash(OrderEntity orderEntity, BuildContext context) {
    if (orderEntity.payWithCash != null) {
      _pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      buildErrorSnackBar(context, "اختر طريقة الدفع");
    }
  }

  void _handeladdressForm(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      autovalidateMode.value = AutovalidateMode.always;
    }
  }

  String getTextPayment() {
    switch (currentPageIndex) {
      case 0:
        return "التالى";
      case 1:
        return "التالى";
      case 2:
        return " الدفع عبر PayPal";
      default:
        return "التالى";
    }
  }

  void _paymentMethod(OrderEntity orderEntity) {
    final OrderEntity orderEntity = context.read<OrderEntity>();
    final payPalPaymentEntity = PayPalPaymentEntity.fromEntity(orderEntity);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: AppKeys.kPayPalClientId,
        secretKey: AppKeys.kPayPalClientSecret,
        transactions: [
          payPalPaymentEntity.toJson(),
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: () {
          Navigator.pop(context);
          buildErrorSnackBar(context, "تم الدفع بنجاح");
        },
        onError: (error) {
          Navigator.pop(context);
          log("payment error= ${error.toString()}");
          buildErrorSnackBar(context, "حدث خطأ ما يرجى المحاولة مرة أخرى");
        },
        onCancel: () {
          log("payment canceled");
          Navigator.pop(context);
          buildErrorSnackBar(context, "تم الغاء الدفع");
        },
      ),
    ));
  }
}
