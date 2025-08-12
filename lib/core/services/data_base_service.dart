abstract class DataBaseService {
  //create method to add data to database;
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      required String documentId});

  //create method to get usesr data from database;
  Future<dynamic> getData(
      {required String path, String? documentId, Map<String, dynamic>? query});

  // create method that check if data is exits;
  Future<bool> checkDataExists(
      {required String path, required String documentId});

  //create method to delete data from database;
  Future<void> deleteData({required String path, required String documentId});

  // create method that check if email of user is exits;
  Future<bool> checkEmailExists({required String path, required String email});
}
