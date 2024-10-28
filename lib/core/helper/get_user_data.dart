import 'dart:convert';

import 'package:fruits_hub/core/constant/constant.dart';
import 'package:fruits_hub/core/services/shared_prefrence_sigelton.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

import '../../features/auth/data/models/user_model.dart';

UserEntity getUserData() {
  String? jsonData = SharedPrefrenceSigelton.getString(key: kUserData);

  UserEntity userEntity = UserModel.fromJson(jsonDecode(jsonData!));
  return userEntity;
}
