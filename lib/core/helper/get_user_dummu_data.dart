import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

UserEntity getDummyUserEntity() {
  return UserEntity(
    image: "https://nzyzfagaxchrgmnurlwo.supabase.co/storage/v1/object/public/userImages/images/profile_image1.jpeg",
    email: "test@test.com",
    userName: "test",
    uid: "123",
  );
}
