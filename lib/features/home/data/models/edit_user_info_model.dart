import 'dart:io';

import '../../domain/entities/edit_user_info_entity.dart';

class EditUserInfoModel {
  String? name;
  String? email;
  String? newPassword;
  File? image;

  EditUserInfoModel({this.name, this.email, this.image, this.newPassword});

  factory EditUserInfoModel.fromJson(Map<String, dynamic> json) =>
      EditUserInfoModel(
        name: json['userName'],
        email: json['email'],
        image: json['image'],
        newPassword: json['newPassword'],
      );

  factory EditUserInfoModel.fromEntity(EditUserInfoEntity editUserInfoEntity) =>
      EditUserInfoModel(
        name: editUserInfoEntity.name,
        email: editUserInfoEntity.email,
        image: editUserInfoEntity.image,
        newPassword: editUserInfoEntity.newPassword,
      );

  Map<String, dynamic> toJson() => {
        'userName': name,
        'email': email,
        'image': image,
        'newPassword': newPassword,
      };
}
