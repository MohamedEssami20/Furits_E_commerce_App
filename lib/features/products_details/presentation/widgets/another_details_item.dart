import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnotherProductsDetailsItem extends StatelessWidget {
  const AnotherProductsDetailsItem(
      {super.key,
      required this.title,
      required this.value,
      required this.image});
  final String title, value;
  final String image;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsetsDirectional.only(
        end: 16,
        start: 20,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFFF1F1F5),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        title: Text(
          value,
          textAlign: TextAlign.right,
          style: theme.textTheme.headlineLarge!.copyWith(
            color: theme.colorScheme.onSecondaryFixed,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            title,
            textAlign: TextAlign.right,
            style: theme.textTheme.headlineMedium!.copyWith(
                fontSize: 13, color: const Color(0xFF969899), height: 1.70),
          ),
        ),
        trailing: SvgPicture.asset(
          image,
        ),
      ),
    );
  }
}
