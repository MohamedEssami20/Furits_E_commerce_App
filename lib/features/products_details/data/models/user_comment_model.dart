import 'package:fruits_hub/features/products_details/domain/entities/user_comments_entity.dart';

class UserReviewModel {
  final String comment;
  final String userName;
  final String userId;
  final int rate;
  final String date;
  final String userImage;

  UserReviewModel({
    required this.comment,
    required this.userName,
    required this.userImage,
    required this.date,
    required this.userId,
    required this.rate,
  });

  factory UserReviewModel.fromJson(Map<String, dynamic> json) {
    return UserReviewModel(
      comment: json['comment'],
      userName: json['userName'],
      userImage: json['userImage'],
      date: json['date'],
      userId: json['userId'],
      rate: json['rate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    data['userName'] = userName;
    data['userImage'] = userImage;
    data['date'] = date;
    data['userId'] = userId;
    data['rate'] = rate;
    return data;
  }

  UserReviewEntity toEntity() {
    return UserReviewEntity(
      comment: comment,
      userName: userName,
      userImage: userImage,
      date: date,
      userId: userId,
      rate: rate,
    );
  }
}
