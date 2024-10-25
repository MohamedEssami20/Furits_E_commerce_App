class UserEntity {
  final String email;
  final String userName;
  final String uid;

  UserEntity(
      {required this.email,
      required this.userName,
      required this.uid});

  toMap() {
    return {
      "email": email,
      "userName": userName,
      "uid": uid,
    };
  }
}
