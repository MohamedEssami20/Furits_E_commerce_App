import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> createUserWithEmailAndPassword(
      {required String email, required String password});
}
 