import 'package:get_storage/get_storage.dart';

const String CACHE_USER_NIM = "user_nim";

class Api2 {
  final box = GetStorage();

  Future setUserNim({String? userNim}) async {
    if (userNim == null) userNim = "";
    await box.write(CACHE_USER_NIM, userNim);
  }

  Future<String?> getUserNim() async {
    return box.read(CACHE_USER_NIM);
    // return "1515015221";
  }
}
