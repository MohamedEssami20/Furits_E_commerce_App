class UserReviewEntity {
  final String userName;
  final String comment;
  final String userId;
  final int rate;
  final String date;
  final String userImage;
  UserReviewEntity({
    required this.userName,
    required this.comment,
    required this.date,
    required this.userImage,
    required this.userId,
    required this.rate,
  });
}
