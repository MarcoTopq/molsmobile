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

class ControllerKelas extends GetxController {
  RxList<PostModel> listPost = RxList<PostModel>();

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
}
