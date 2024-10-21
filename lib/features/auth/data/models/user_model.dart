import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.email,
      required super.userName,
      required super.uid});

  factory UserModel.fromFirebaseUser({required User user}) {
    return UserModel(
      email: user.email??'',
      userName: user.displayName??'',
      uid: user.uid,
    );
  }
}
