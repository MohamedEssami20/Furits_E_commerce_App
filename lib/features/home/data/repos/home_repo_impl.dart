import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';

import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DataBaseService dataBaseService;

  HomeRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, UserEntity>> getUserData({required String uid}) async {
    try {
      Map<String, dynamic> data = await dataBaseService.getData(
          path: BackendEndpoints.addUsersData, documentId: uid);
      UserEntity user = UserModel.fromJson(data);
      return right(
        user,
      );
    } on FirebaseException catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى",
        ),
      );
    }
  }
}
