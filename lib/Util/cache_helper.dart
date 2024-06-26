import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper{

  static FlutterSecureStorage?storage;

  static init()async
  {
    storage = const FlutterSecureStorage();
  }

   static Future<void> putData({required String key,required value})async
  {
    await storage!.write(key: key, value:value );
  }

   static Future<dynamic> getData({required String key})async
  {
    return await storage!.read(key: key);
  }


}