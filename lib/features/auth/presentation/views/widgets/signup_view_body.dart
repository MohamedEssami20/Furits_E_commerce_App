import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/features/auth/presentation/manager/signup_cubit/signup_user_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_condition.dart';

import '../../../../../core/utils/Widgets/password_text_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String userName, email, password;
  late bool isTermsAndConditionAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autoValidateMode,
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomTextFormFiled(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الاسم كامل مطلوب';
                  }
                  return null;
                },
                onSaved: (value) {
                  userName = value!;
                },
                hintText: "الاسم كامل",
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormFiled(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'البريد الالكتروني مطلوب';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
                hintText: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TermsAndCondition(
                onCahanged: (value) {
                  isTermsAndConditionAccepted = value;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 35,
              ),
              CustomButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (isTermsAndConditionAccepted) {
                      await context
                          .read<SignupUserCubit>()
                          .createUserWithEmailAndPassword(
                            name: userName,
                            email: email,
                            password: password,
                          );
                    } else {
                      buildErrorSnackBar(
                          context, "يجب ان تقبل الشروط والاحكام");
                    }
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                title: "إنشاء حساب جديد",
              ),
              const SizedBox(
                height: 40,
              ),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
