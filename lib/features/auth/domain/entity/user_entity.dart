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

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      email: map["email"],
      userName: map["userName"],
      uid: map["uid"],
    );
  }
}
