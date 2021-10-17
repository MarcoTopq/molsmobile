import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:molsmobile/api/api1.dart';

class PostModel {
  int id;
  String title;
  String text;
  String dateLimit;
  String minutes;
  String postType;
  String idSoal;

  PostModel({
    required this.id,
    required this.title,
    required this.text,
    required this.dateLimit,
    required this.minutes,
    required this.postType,
    required this.idSoal,
  });
}

class SoalModel {
  String text;
  String soalId;
  String postId;

  String dosenId;
  String soalType;
  String bobot;
  String kunci;
  String opsiA;
  String hurufA;
  String opsiB;
  String hurufB;
  String opsiC;
  String hurufC;
  String opsiD;
  String hurufD;

  SoalModel({
    required this.text,
    required this.soalId,
    required this.postId,
    required this.dosenId,
    required this.soalType,
    required this.bobot,
    required this.kunci,
    required this.opsiA,
    required this.hurufA,
    required this.opsiB,
    required this.hurufB,
    required this.opsiC,
    required this.hurufC,
    required this.opsiD,
    required this.hurufD,
  });
}

class SoalScreenModel {
  String text;
  String soalId;
  String postId;
  String dosenId;
  String soalType;
  String bobot;
  String kunci;
  String opsiA;
  String hurufA;
  String opsiB;
  String hurufB;
  String opsiC;
  String hurufC;
  String opsiD;
  String hurufD;

  SoalScreenModel({
    required this.text,
    required this.soalId,
    required this.postId,
    required this.dosenId,
    required this.soalType,
    required this.bobot,
    required this.kunci,
    required this.opsiA,
    required this.hurufA,
    required this.opsiB,
    required this.hurufB,
    required this.opsiC,
    required this.hurufC,
    required this.opsiD,
    required this.hurufD,
  });
}

class ControllerHome extends GetxController {
  RxList<PostModel> listPost = RxList<PostModel>();
  RxList<SoalModel> listSoal = RxList<SoalModel>();
  RxList<SoalScreenModel> soal = RxList<SoalScreenModel>();

  RxString idSoal = "".obs;
  RxString title = "".obs;
  RxString text = "".obs;
  RxString dateLimit = "".obs;
  RxString minutes = "".obs;
  RxString postType = "".obs;

  setSoal(int indexSoal) {
    soal.add(SoalScreenModel(
      text: listSoal[indexSoal].text,
      dosenId: listSoal[indexSoal].dosenId,
      soalType: listSoal[indexSoal].soalType,
      bobot: listSoal[indexSoal].bobot,
      kunci: listSoal[indexSoal].kunci,
      hurufA: listSoal[indexSoal].hurufA,
      opsiA: listSoal[indexSoal].opsiA,
      hurufB: listSoal[indexSoal].hurufB,
      opsiB: listSoal[indexSoal].opsiB,
      hurufC: listSoal[indexSoal].hurufC,
      opsiC: listSoal[indexSoal].opsiC,
      hurufD: listSoal[indexSoal].hurufD,
      opsiD: listSoal[indexSoal].opsiD,
      postId: listSoal[indexSoal].postId,
      soalId: listSoal[indexSoal].soalId,
    ));
  }

  Future<dynamic> getPost() async {
    return Api1().getPost().then((value) {
      // this.title(value["title"]);
      // this.text(value["text"]);
      // this.dateLimit(value["date_limit"]);
      // this.minutes(value["minutes"]);
      // this.postType(value["post_type"]);
      for (var y in value) {
        for (var x in y['post']) {
          this.listPost.add(PostModel(
                id: y["id"],
                idSoal: x["id"].toString(),
                title: x["title"].toString(),
                text: x["text"].toString(),
                dateLimit: x["dateLimit"].toString(),
                minutes: x["minutes"].toString(),
                postType: x["postType"].toString(),
              ));
        }
      }
      print("result login: $value");
      update();
    }).catchError((e) => throw (e));
  }

  Future<dynamic> getSoal({required String id}) async {
    return Api1().getSoal(id: id).then((value) {
      // this.title(value["title"]);
      // this.text(value["text"]);
      // this.dateLimit(value["date_limit"]);
      // this.minutes(value["minutes"]);
      // this.postType(value["post_type"]);
      for (var y in value) {
        for (var x in y['pilihan']) {
          if (x["soal_type"] == "ganda") {
            this.listSoal.add(SoalModel(
                  text: x["text"].toString(),
                  dosenId: x["dateLimit"].toString(),
                  soalType: x["soal_type"].toString(),
                  bobot: x["bobot"].toString(),
                  kunci: x["kunci"].toString(),
                  hurufA: x["ganda"][0]["huruf"].toString(),
                  opsiA: x["ganda"][0]["opsi"].toString(),
                  hurufB: x["ganda"][1]["huruf"].toString(),
                  opsiB: x["ganda"][1]["opsi"].toString(),
                  hurufC: x["ganda"][2]["huruf"].toString(),
                  opsiC: x["ganda"][2]["opsi"].toString(),
                  hurufD: x["ganda"][3]["huruf"].toString(),
                  opsiD: x["ganda"][3]["opsi"].toString(),
                  postId: y["post_id"].toString(),
                  soalId: y["soal_id"].toString(),
                ));
          } else {
            this.listSoal.add(SoalModel(
                  text: x["text"].toString(),
                  dosenId: x["dateLimit"].toString(),
                  soalType: x["soal_type"].toString(),
                  bobot: x["bobot"].toString(),
                  kunci: x["kunci"].toString(),
                  hurufA: '',
                  opsiA: '',
                  hurufB: '',
                  opsiB: '',
                  hurufC: '',
                  hurufD: '',
                  opsiC: '',
                  opsiD: '',
                  postId: y["post_id"].toString(),
                  soalId: y["soal_id"].toString(),
                ));
          }
        }
      }
      print("result login: $value");
      update();
    }).catchError((e) => throw (e));
  }
}
