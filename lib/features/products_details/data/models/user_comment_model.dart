import 'package:fruits_hub/features/products_details/domain/entities/user_comments_entity.dart';

class UserCommentModel {
  final String comment;
  final String userName;
  final String date;
  final String userImage;
  UserCommentModel({
    required this.comment,
    required this.userName,
    required this.userImage,
    required this.date,
  });

  factory UserCommentModel.fromJson(Map<String, dynamic> json) {
    return UserCommentModel(
      comment: json['comment'],
      userName: json['userName'],
      userImage: json['userImage'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    data['userName'] = userName;
    data['userImage'] = userImage;
    data['date'] = date;
    return data;
  }

  UserCommentsEntity toEntity() {
    return UserCommentsEntity(
      comment: comment,
      userName: userName,
      userImage: userImage,
      date: date,
    );
  }
}
