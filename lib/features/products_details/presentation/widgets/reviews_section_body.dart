import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/build_appbar.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../manager/details_and_reviews_cubit/detais_and_reviews_cubit.dart';
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
            onBackPress: () =>
                context.read<DetailsAndReviewsCubit>().changeIndex(0),
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
          const SizedBox(
            height: 12,
          ),
          const Expanded(child: PeopleCommentsList()),
        ],
      ),
    );
  }
}

class PeopleCommentsItem extends StatelessWidget {
  const PeopleCommentsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              Assets.assetsImagesProfileImage,
            ),
          ),
          title: Text(
            'Ahmed Mohamed',
            style: TextStyles.semiBold16.copyWith(
              height: 1.40,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            '25/06/2020',
            style: TextStyles.regular13.copyWith(
              height: 1.60,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Text(
          'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
          textAlign: TextAlign.right,
          style: TextStyles.regular13.copyWith(
            height: 1.60,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class PeopleCommentsList extends StatelessWidget {
  const PeopleCommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => const PeopleCommentsItem(),
    );
  }
}
