import 'package:flutter/material.dart';

import 'people_comment_item.dart';

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
