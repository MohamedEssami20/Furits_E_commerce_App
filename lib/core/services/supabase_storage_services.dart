import 'dart:developer';
import 'dart:io';
import 'package:fruits_hub/core/helper/app_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'storage_services.dart';
import 'package:path/path.dart' as p;

class SupabaseStorageServices implements StorageServices {
  static late Supabase _supabase;

  // inialize supabase
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: AppKeys.supabaseProjectUrl,
      anonKey: AppKeys.supabasseProjectApoKey,
    );
    log("supabase initialized ***");
  }

  // create supabase buket
  Future<void> createBucket(String buketName) async {
    BucketOptions bucketOptions = const BucketOptions(
      public: true,
    );

    List<Bucket> buckets = await _supabase.client.storage.listBuckets();
    if (!buckets.any((element) => element.name == buketName)) {
      await _supabase.client.storage.createBucket(buketName, bucketOptions);
    }
  }

  @override
  Future<String> addPhotoToStorage(
      {required File file, required String path}) async {
    String fileName = p.basename(file.path);
    String fileExetension = p.extension(file.path);
    String result = await _supabase.client.storage
        .from("userImages")
        .upload("$path/$fileName.$fileExetension", file);
    log("image upload = $result");
    return result;
  }
}
