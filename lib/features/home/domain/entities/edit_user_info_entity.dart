import 'dart:io';

class EditUserInfoEntity {
  String? name;
  String? email;
  String? newPassword;
  File? image;

  EditUserInfoEntity({this.name, this.email, this.image});

  EditUserInfoEntity.fromJson(Map<String, dynamic> json) {
    name = json['userName'];
    email = json['email'];
    image = json['image'];
    newPassword = json['newPassword'];
  }
}