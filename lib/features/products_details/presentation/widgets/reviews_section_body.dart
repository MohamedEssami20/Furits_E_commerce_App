import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/build_appbar.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/generated/l10n.dart';

import 'summary_of_rating.dart';

class ReviewsSectionBody extends StatelessWidget {
  const ReviewsSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBarOne(
            title: S.of(context).reviews,
            context: context,
            showBackButton: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormFiled(
            hintText: S.of(context).writeComment,
            textInputType: TextInputType.text,
            prefixIcon: const Padding(
              padding: EdgeInsetsDirectional.only(start: 10, end: 8),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  Assets.assetsImagesBoldAvatar,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            '324 ${S.of(context).review}',
            style: TextStyles.bold13.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SummaryOfRating(),
        ],
      ),
    );
  }
}
