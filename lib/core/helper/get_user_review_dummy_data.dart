import 'package:fruits_hub/features/products_details/domain/entities/user_comments_entity.dart';

UserReviewEntity getReviewDummyData() => UserReviewEntity(
      userName: 'Sara Ali',
      date: '1 day ago',
      rate: 5,
      comment: "its very nice",
      userId: "12411521",
      userImage:
          "https://nzyzfagaxchrgmnurlwo.supabase.co/storage/v1/object/public/userImages/images/profile_image1.jpeg",
    );
