import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final secureStorage = FlutterSecureStorage();

  Future<void> storeToken(String token) async {
    await secureStorage.write(key: "token", value: token);
  }

  Future<String?> readToken() async{
    final token = await secureStorage.read(key: "token");
    return token;
  }

  Future<void> deleteToken() async{
    await secureStorage.delete(key: "token");
  }
}
