import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
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
                var orderEntity = context.read<OrderEntity>();
                context
                    .read<AddOrderCubit>()
                    .addOrder(ordereEntity: orderEntity);
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
}
