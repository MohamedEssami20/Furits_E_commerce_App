import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_style.dart' show TextStyles;
import '../../../../generated/l10n.dart' show S;

class ProductsDetailsTitle extends StatelessWidget {
  const ProductsDetailsTitle(
      {super.key,
      required this.theme,
      required this.prductName,
      required this.prductPrice});
  final ThemeData theme;
  final String prductName;
  final String prductPrice;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        prductName,
        textAlign: TextAlign.start,
        style: theme.textTheme.headlineLarge!.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(
          top: 8,
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "$prductPrice${S.of(context).egp}",
                style: TextStyles.bold13.copyWith(
                  color: Theme.of(context).colorScheme.primaryFixed,
                ),
              ),
              TextSpan(
                text: '/',
                style: TextStyles.bold13.copyWith(
                  color: Theme.of(context).colorScheme.primaryFixed,
                ),
              ),
              const TextSpan(
                text: ' ',
                style: TextStyles.semiBold13,
              ),
              TextSpan(
                text: S.of(context).kg,
                style: TextStyles.semiBold13.copyWith(
                  color: Theme.of(context).colorScheme.tertiaryFixed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
