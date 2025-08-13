import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_hub/core/errors/dio_errors.dart';

import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/api_services.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';

import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/repos/reset_password_repo.dart';

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final ApiServices apiServices;
  final DataBaseService dataBaseService;
  final FirestoreService firestoreService = FirestoreService();
  ResetPasswordRepoImpl({
    required this.apiServices,
    required this.dataBaseService,
  });
  @override
  Future<Either<Failure, void>> sendCodeVerification(
      {required String email, required int code}) async {
    final isUserExists = await firestoreService.checkEmailExists(
      path: BackendEndpoints.addUserData,
      email: email,
    );
    if (isUserExists) {
      try {
        await apiServices.post(
          BackendEndpoints.sendEmailBaseUrl,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
          ),
          data: {
            "service_id": BackendEndpoints.sendEmailServiceId,
            "template_id": BackendEndpoints.sendEmailTemplateId,
            "user_id": BackendEndpoints.sendEmailPublicKey,
            "accessToken": BackendEndpoints.sendEmailPrivateKey,
            "template_params": {
              'to_email': email,
              'verification_code': code,
            }
          },
        );
        await saveCodeVerification(email, code);
        return right(null);
      } on DioException catch (error) {
        // delete code from firestore
        await deleteCodeVerification(email);
        log("Exception in reset password repo dio= ${error.toString()}");
        return left(
          ApiServerErrors.fromDioError(error),
        );
      } catch (error) {
        // delete code from firestore
        await deleteCodeVerification(email);
        log("Exception in reset password repo= ${error.toString()}");
        return left(
          ServerFailure(
            errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى",
          ),
        );
      }
    } else {
      return Left(
        ServerFailure(
          errorMessage: "البريد الالكتروني غير موجود",
        ),
      );
    }
  }

  Future<void> deleteCodeVerification(String email) async {
    await dataBaseService.deleteData(
      documentId: email,
      path: BackendEndpoints.verifcationCodeColloection,
    );
  }

  Future<void> saveCodeVerification(String email, int code) async {
    await dataBaseService.addData(
      path: BackendEndpoints.verifcationCodeColloection,
      documentId: email,
      data: {
        "code": code,
        "email": email,
      },
    );
  }

  @override
  Future<Either<Failure, void>> checkVerificationCode(
      {required int code, required String email}) async{
    // fetch code from firestore;
    try{
      final result = await dataBaseService.getData(
      path: BackendEndpoints.verifcationCodeColloection,
      documentId: email,
    );
    if(result["code"] == code){
      return right(null);
    }else{
      return left(
        ServerFailure(
          errorMessage: "الكود المدخل غير صحيح",
        ),
      );
    }
    }catch(e){
      log("Exception in check verification code= ${e.toString()}");
      return left(
        ServerFailure(
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى",
        ),
      );
    }
    
  }
}
