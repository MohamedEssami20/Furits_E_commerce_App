import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/assets.dart';

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