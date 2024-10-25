abstract class DataBaseService {
  //create method to add data to database;
  Future<void> addData({required String path, required Map<String ,dynamic> data});
}
