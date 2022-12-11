import 'dart:developer';

import 'package:get_storage/get_storage.dart';

const String CACHE_USER_NIM = "user_nim";
const String CACHE_USER_TYPE = "user_type";

class Api2 {
  final box = GetStorage();

  Future setUserNim({String? userNim}) async {
    if (userNim == null) userNim = "";
    log('data tersimpan :' + userNim);
    await box.write(CACHE_USER_NIM, userNim);
  }

  Future<String?> getUserNim() async {
    var data = await box.read(CACHE_USER_NIM);
    log('data nya :' + data.toString());
    return data;
    // return "1515015221";
  }

  Future setTypeUser({String? type}) async {
    if (type == null) type = "";
    log('data tersimpan :' + type);
    await box.write(CACHE_USER_TYPE, type);
  }

  Future<String?> getTypeUser() async {
    var data = await box.read(CACHE_USER_TYPE);
    log('data nya :' + data.toString());
    return data;

    // return "1515015221";
  }
}
