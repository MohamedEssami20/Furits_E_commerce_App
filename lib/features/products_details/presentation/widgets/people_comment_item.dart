import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import '../../domain/entities/user_comments_entity.dart';

class PeopleCommentsItem extends StatelessWidget {
  const PeopleCommentsItem({super.key, required this.userReviewEntity});
  final UserReviewEntity userReviewEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
              userReviewEntity.userImage,
            ),
          ),
          title: Text(
            userReviewEntity.userName,
            style: TextStyles.semiBold16.copyWith(
              height: 1.40,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            userReviewEntity.date,
            style: TextStyles.regular13.copyWith(
              height: 1.60,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Text(
          userReviewEntity.comment,
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
