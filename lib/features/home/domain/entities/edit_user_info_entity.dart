
class EditUserInfoEntity {
  String? name;
  String? email;
  String? newPassword;
  String ?oldPassword;

  EditUserInfoEntity({this.name, this.email, this.oldPassword, this.newPassword});

  EditUserInfoEntity.fromJson(Map<String, dynamic> json) {
    name = json['userName'];
    email = json['email'];
    oldPassword= json['oldPassword'];
    newPassword = json['newPassword'];
  }
}