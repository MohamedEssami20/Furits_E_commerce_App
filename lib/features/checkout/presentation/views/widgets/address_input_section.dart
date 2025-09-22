import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import '../../../../../generated/l10n.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection(
      {super.key, required this.formKey, required this.autoValidateMode});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> autoValidateMode;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: autoValidateMode,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              CustomTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().orderAddressDetails.fullName =
                      value!;
                },
                hintText: S.of(context).fullNameHint,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().orderAddressDetails.email = value;
                },
                hintText: S.of(context).emailHint,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().orderAddressDetails.address =
                      value;
                },
                hintText: S.of(context).address,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().orderAddressDetails.phone = value;
                },
                hintText: S.of(context).phoneNumber,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().orderAddressDetails.city = value;
                },
                hintText: S.of(context).city,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().orderAddressDetails.floorName =
                      value;
                },
                hintText: S.of(context).floorNumber,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
