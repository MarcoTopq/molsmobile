import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:molsmobile/api/api1.dart';
import 'package:molsmobile/api/api2.dart';

class Jawaban {
  String jawaban;
  String bobot;
  String userId;
  String soalId;
  String postId;

  String status;
  String type;

  Jawaban({
    required this.jawaban,
    required this.bobot,
    required this.userId,
    required this.soalId,
    required this.postId,
    required this.status,
    required this.type,
  });
}

class ControllerMahasiswa extends GetxController {
  RxList<Jawaban> listJawaban = RxList<Jawaban>();

  RxString userId = "".obs;
  RxString nim = "".obs;
  RxString name = "".obs;
  RxString generation = "".obs;
  RxString phone = "".obs;
  RxString email = "".obs;
  RxString ipk = "".obs;
  RxString academicYear = "".obs;
  RxString nameDepartment = "".obs;
  RxString degree = "".obs;
  RxString nameFaculty = "".obs;

  simpanJawaban({
    required String jawaban,
    required String bobot,
    required String userId,
    required String soalId,
    required String postId,
    required String status,
    required String type,
  }) {
    this.listJawaban.add(Jawaban(
          jawaban: jawaban,
          bobot: bobot,
          userId: userId,
          soalId: soalId,
          postId: postId,
          status: status,
          type: type,
        ));
  }

  Future<dynamic> kirimJawaban() async {
    try {
      for (var i in listJawaban) {
        await Api1().kirimJawaban(
            jawaban: i.jawaban,
            bobot: i.bobot,
            userId: i.userId,
            soalId: i.soalId,
            postId: i.postId,
            status: i.status,
            type: i.type);
      }
      listJawaban.clear();

      Get.snackbar("Warning", "Username & Password harus diisi",
          backgroundColor: Colors.yellow);
    } catch (e) {
      throw (e);
    }
  }

  Future<dynamic> login({
    required String userid,
    required String password,
  }) async {
    return Api1().login(userid: userid, password: password).then((value) {
      this.userId(value["data"]["id"]);
      this.nim(value["data"]["nim"]);
      this.name(value["data"]["name"]);
      this.generation(value["data"]["generation"].toString());
      this.phone(value["data"]["phone"]);
      this.email(value["data"]["email"]);
      this.ipk(value["data"]["ipk"].toString());
      this.academicYear(value["data"]["academic_year"].toString());
      this.nameDepartment(value["data"]["departement_name"]);
      this.degree(value["data"]["degree"]);
      this.nameFaculty(value["data"]["faculty_name"]);

      Api2().setUserNim(userNim: value["data"]["nim"]);
      Api2().setTypeUser(type: value["data"]["group"]);
      print("result login: $value");
      update();
    }).catchError((e) => throw (e));
  }
}
