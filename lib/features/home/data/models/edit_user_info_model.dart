
import '../../domain/entities/edit_user_info_entity.dart';

class EditUserInfoModel {
  String? name;
  String? email;
  String? newPassword;
  String? oldPassword;

  EditUserInfoModel({this.name, this.email, this.oldPassword, this.newPassword});

  factory EditUserInfoModel.fromJson(Map<String, dynamic> json) =>
      EditUserInfoModel(
        name: json['userName'],
        email: json['email'],
        oldPassword: json['oldPassword'],
        newPassword: json['newPassword'],
      );

  factory EditUserInfoModel.fromEntity(EditUserInfoEntity editUserInfoEntity) =>
      EditUserInfoModel(
        name: editUserInfoEntity.name,
        email: editUserInfoEntity.email,
        oldPassword: editUserInfoEntity.oldPassword,
        newPassword: editUserInfoEntity.newPassword,
      );

  Map<String, dynamic> toJson() => {
        'userName': name,
        'email': email,
        'image': oldPassword,
        'newPassword': newPassword,
      };
}
