import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.email,
      required super.userName,
      required super.uid,
      required super.image});

  factory UserModel.fromFirebaseUser({required User user}) {
    return UserModel(
      email: user.email ?? '',
      userName: user.displayName ?? '',
      image: user.photoURL ?? BackendEndpoints.defaultImage,
      uid: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      userName: json['userName'],
      uid: json['uid'],
      image: json['image'],
    );
  }

  factory UserModel.formUserEntity({required UserEntity userEntity}) {
    return UserModel(
      email: userEntity.email,
      userName: userEntity.userName,
      uid: userEntity.uid,
      image: userEntity.image,
    );
  }

  toMap() {
    return {
      "email": email,
      "userName": userName,
      "uid": uid,
      "image": image,
    };
  }
}
