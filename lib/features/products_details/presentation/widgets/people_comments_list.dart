import 'package:flutter/material.dart';
import 'package:fruits_hub/features/products_details/domain/entities/user_comments_entity.dart';
import 'people_comment_item.dart';

class PeopleCommentsList extends StatelessWidget {
  const PeopleCommentsList(
      {super.key, required this.userReviewEntity});
  final List<UserReviewEntity> userReviewEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: userReviewEntity.length,
      itemBuilder: (context, index) => PeopleCommentsItem(
        userReviewEntity: userReviewEntity[index],
      ),
    );
  }
}
