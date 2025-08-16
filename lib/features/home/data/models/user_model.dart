import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

class UserModel {
  final String name;
  final String email;
  final String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['userName'],
      email: json['email'],
      uid: json['uid'],
    );
  }


  UserEntity toEntity() {
    return UserEntity(
      userName: name,
      email: email,
      uid: uid,
    );
  }
}
