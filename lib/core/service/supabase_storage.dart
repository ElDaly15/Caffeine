import 'dart:io';

import 'package:caffeine/core/service/storage_services.dart';
import 'package:caffeine/core/utils/consts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as b;

class SupabaseStorage implements StorageServices {
  // ignore: unused_field
  static late Supabase _supaClinet;

  static createBucket({required String bucketName}) async {
    bool isBucketExsist = false;
    var buckets = await _supaClinet.client.storage.listBuckets();
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExsist = true;
        break;
      }
    }
    if (!isBucketExsist) {
      await _supaClinet.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supaClinet = await Supabase.initialize(
      url: Consts.supabaseProjectUrl,
      anonKey: Consts.supabaseProjectApi,
    );
  }

  @override
  Future<String> uploadImage({required File file, required String path}) async {
    String fileName = b.basename(file.path);

    final List<FileObject> objects =
        await _supaClinet.client.storage.from('userImages').list();
    bool checkExist = false;
    for (var image in objects) {
      if (image.name == fileName) {
        checkExist = true;
        break;
      }
    }

    if (!checkExist) {
      await _supaClinet.client.storage
          .from('userImages')
          .upload(fileName, file);
    }

    String publicUrl =
        _supaClinet.client.storage.from('userImages').getPublicUrl(fileName);

    return publicUrl;
  }
}
