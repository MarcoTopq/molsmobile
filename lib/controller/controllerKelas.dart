import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:molsmobile/api/api1.dart';

class PostModel {
  String title;
  String text;
  String dateLimit;
  String minutes;
  String postType;

  PostModel({
    required this.title,
    required this.text,
    required this.dateLimit,
    required this.minutes,
    required this.postType,
  });
}

class KelasModel {
  late int id;
  late String name;
  late String userId;
  late String kode;
  late String description;
  late String slug;
  late String status;
  late String access;
  late String year;
  late String type;
  late String prodiId;

  KelasModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.kode,
    required this.description,
    required this.slug,
    required this.status,
    required this.access,
    required this.year,
    required this.type,
    required this.prodiId,
  });
}

class ControllerKelas extends GetxController {
  RxList<PostModel> listPost = RxList<PostModel>();
  RxList<KelasModel> listKelas = RxList<KelasModel>();

  RxString title = "".obs;
  RxString text = "".obs;
  RxString dateLimit = "".obs;
  RxString minutes = "".obs;
  RxString postType = "".obs;

  Future<dynamic> getKelas() async {
    return Api1().getPost().then((value) {
      // this.title(value["title"]);
      // this.text(value["text"]);
      // this.dateLimit(value["date_limit"]);
      // this.minutes(value["minutes"]);
      // this.postType(value["post_type"]);
      for (var y in value) {
        for (var x in y['post']) {
          this.listPost.add(PostModel(
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

  Future<dynamic> getKelasAll() async {
    return Api1().getKelas().then((value) {
      // this.title(value["title"]);
      // this.text(value["text"]);
      // this.dateLimit(value["date_limit"]);
      // this.minutes(value["minutes"]);
      // this.postType(value["post_type"]);
      // for (var y in value) {
      for (var x in value) {
        this.listKelas.add(KelasModel(
              id: x["id"],
              name: x["name"].toString(),
              userId: x["user_id"].toString(),
              kode: x["kode"].toString(),
              description: x["description"].toString(),
              type: x["type"].toString(),
              slug: x["slug"].toString(),
              status: x["status"].toString(),
              access: x["access"].toString(),
              year: x["year"].toString(),
              prodiId: x["prodiId"].toString(),
            ));
      }
      // }
      print("result login: $value");
      update();
    }).catchError((e) => throw (e));
  }
}
