import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart' show TextStyles;
import 'package:fruits_hub/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/code_input_field.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';
import 'check_code_verification_builder.dart';

class CheckCodeViewBody extends StatefulWidget {
  const CheckCodeViewBody({super.key, required this.email});
  final String email;

  @override
  State<CheckCodeViewBody> createState() => _CheckCodeViewBodyState();
}

List<GlobalKey<FormState>> formKey = <GlobalKey<FormState>>[
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
];

List<AutovalidateMode> autoValidateMode = <AutovalidateMode>[
  AutovalidateMode.disabled,
  AutovalidateMode.disabled,
  AutovalidateMode.disabled,
  AutovalidateMode.disabled,
];

List<TextEditingController> _controllers = List.generate(
  4,
  (index) => TextEditingController(),
);

int getCurrentCode() {
  int code = 0;
  for (var c in _controllers) {
    code = code * 10 + int.parse(c.text);
  }
  return code;
}

class _CheckCodeViewBodyState extends State<CheckCodeViewBody> {
  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "أدخل الرمز الذي أرسلناه إلى عنوان بريد الكتروني ${widget.email}",
            textAlign: TextAlign.right,
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CodeInputField(
            formKey: formKey,
            autoValidateMode: autoValidateMode,
            controllers: _controllers,
          ),
          const SizedBox(
            height: 30,
          ),
          CheckCodeVerificationBuilder(
            onPressed: () {
              if (formKey
                  .every((element) => element.currentState!.validate())) {
                for (var element in formKey) {
                  element.currentState!.save();
                }
                context.read<ResetPasswordCubit>().checkVerificationCode(
                      email: widget.email,
                      code: getCurrentCode(),
                      genralErrorMessage: S.of(context).errorMessage,
                      codeErrorMessage: S.of(context).verificationCodeError,
                    );
              } else {
                setState(() {
                  autoValidateMode = [
                    AutovalidateMode.always,
                    AutovalidateMode.always,
                    AutovalidateMode.always,
                    AutovalidateMode.always,
                  ];
                });
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'إعادة إرسال الرمز',
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.lightSecondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
