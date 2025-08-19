import 'dart:io';

abstract class StorageServices {
  // create method that add photo to storage
  Future<String> addPhotoToStorage(
      {required File file, required String path});
}
