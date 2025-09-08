import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataBaseService {
  //create method to add data to database;
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      required String documentId});

  //create method that add data with extends document id;
  Future<void> addDataWithDocumentId(
      {required String mainPath,
      required String subPath,
      required Map<String, dynamic> data,
      required String mainDocumentId,
      required String subDocumentId});

  //create method to get usesr data from database;
  Future<dynamic> getData(
      {required String path, String? documentId, Map<String, dynamic>? query});

  // create get stream to get data from database;
  Stream<Map<String, dynamic>> getStreamData(
      {required String path, String? documentId, Map<String, dynamic>? query});
  // create method that check if data is exits;

  // create method that get stream data from extends document id;
  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getStreamDataWithDocumentId(
          {required String mainPath,
          required String subPath,
          String? documentId,
          Map<String, dynamic>? query});

  Future<bool> checkDataExists(
      {required String path, required String documentId});

  //create method to delete data from database;
  Future<void> deleteData({required String path, required String documentId});

  // create method that check if email of user is exits;
  Future<bool> checkEmailExists({required String path, required String email});

  // create get stream of List<String> to get data from database;
  Stream<List<String>> getStreamStringData(
      {required String mainPath,
      required String subPath,
      String? mainDocumentId,
      Map<String, dynamic>? query});
}
