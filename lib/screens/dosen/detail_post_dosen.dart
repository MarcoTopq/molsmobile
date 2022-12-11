import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:molsmobile/controller/controllerHome.dart';
import 'package:molsmobile/controller/controllerMahasiswa.dart';
import 'package:molsmobile/screens/list_nilai.dart';
import 'package:molsmobile/screens/loading.dart';
import 'package:molsmobile/screens/widgets/inputform.dart';
import 'package:molsmobile/screens/widgets/primary_button.dart';

class DetailPostDosen extends StatefulWidget {
  final String? title;
  final String? time;
  final String? content;
  final String image;
  final String id;
  final String idContent;

  const DetailPostDosen(
      {Key? key,
      this.title,
      this.time,
      this.content,
      required this.image,
      required this.id,
      required this.idContent})
      : super(key: key);

  @override
  _DetailPostDosenState createState() => _DetailPostDosenState();
}

class _DetailPostDosenState extends State<DetailPostDosen> {
  TextEditingController _controllerJawaban = TextEditingController();
  final ControllerHome controllerHome = Get.find<ControllerHome>();
  final ControllerMahasiswa controllerMahasiswa =
      Get.find<ControllerMahasiswa>();

  int indexSoal = 0;
  bool isLoading = false;

  double? fabHeight;
  String valueJawaban = '';
  _getData() async {
    _onLoading();
    controllerHome.listSoal.clear();
    print(widget.id);
    await controllerHome.getSoal(id: widget.id);
    controllerHome.soal.clear();

    print(controllerHome.listSoal.length);
    await controllerHome.setSoalDosen(indexSoal, widget.idContent);
    _offLoading();
  }

  _onLoading() {
    setState(() {
      isLoading = true;
    });
  }

  _offLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
    fabHeight = 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Detail Post',
          ),
          centerTitle: true,
        ),
        body: LoadingOverlay(
            isLoading: isLoading,
            progressIndicator: loadingIndicator(),
            child: Stack(children: <Widget>[
              Center(
                  child: Container(
                child: Column(
                  children: [
                    Divider(
                      thickness: 5,
                      indent: 110,
                      endIndent: 110,
                      color: Colors.orange[200],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ListView(children: [
                            Row(
                              children: [
                                _avatar(),
                                Flexible(
                                  child: _text(widget.title, Colors.black, 20.0,
                                      FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // _text("Pak Daus", Colors.black, 15.0,
                                //     FontWeight.normal),
                                _text(widget.time! + " menit", Colors.black,
                                    15.0, FontWeight.normal),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  indexSoal == 0
                                      ? Container(
                                          width: 100,
                                        )
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.indigo[900]),
                                          onPressed: () async {
                                            setState(() {
                                              indexSoal = indexSoal - 1;
                                              controllerHome.soal.clear();
                                            });
                                            await controllerHome
                                                .setSoal(indexSoal);
                                            setState(() {
                                              if (controllerMahasiswa
                                                      .listJawaban.length >
                                                  indexSoal) {
                                                if (controllerMahasiswa
                                                        .listJawaban[indexSoal]
                                                        .type ==
                                                    "ganda") {
                                                  valueJawaban =
                                                      controllerMahasiswa
                                                          .listJawaban[
                                                              indexSoal]
                                                          .jawaban;
                                                } else {
                                                  _controllerJawaban.text =
                                                      controllerMahasiswa
                                                          .listJawaban[
                                                              indexSoal]
                                                          .jawaban;
                                                }
                                              } else {
                                                if (controllerMahasiswa
                                                        .listJawaban[indexSoal]
                                                        .type ==
                                                    "ganda") {
                                                  valueJawaban = "";
                                                } else {
                                                  _controllerJawaban.text = "";
                                                }
                                              }
                                            });
                                          },
                                          child: Text('Sebelumnya')),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow[900]),
                                      onPressed: () {
                                        if (controllerMahasiswa
                                                .listJawaban.length >
                                            indexSoal) {
                                          controllerMahasiswa.listJawaban
                                              .insert(
                                                  indexSoal,
                                                  Jawaban(
                                                      jawaban: controllerHome
                                                                  .listSoal[
                                                                      indexSoal]
                                                                  .soalType ==
                                                              "ganda"
                                                          ? valueJawaban
                                                          : _controllerJawaban
                                                              .text,
                                                      bobot: controllerHome
                                                          .listSoal[indexSoal]
                                                          .bobot,
                                                      userId:
                                                          controllerMahasiswa
                                                              .nim.value,
                                                      soalId: controllerHome
                                                          .listSoal[indexSoal]
                                                          .soalId,
                                                      postId: controllerHome
                                                          .listSoal[indexSoal]
                                                          .postId,
                                                      status: "null",
                                                      type: controllerHome
                                                          .listSoal[indexSoal]
                                                          .soalType));
                                        } else {
                                          controllerMahasiswa.simpanJawaban(
                                              jawaban: controllerHome
                                                          .listSoal[indexSoal]
                                                          .soalType ==
                                                      "ganda"
                                                  ? valueJawaban
                                                  : _controllerJawaban.text,
                                              bobot: controllerHome
                                                  .listSoal[indexSoal].bobot,
                                              userId:
                                                  controllerMahasiswa.nim.value,
                                              soalId: controllerHome
                                                  .listSoal[indexSoal].soalId,
                                              postId: controllerHome
                                                  .listSoal[indexSoal].postId,
                                              status: "null",
                                              type: controllerHome
                                                  .listSoal[indexSoal]
                                                  .soalType);
                                        }
                                      },
                                      child: Text('Simpan')),
                                  Obx(() => indexSoal ==
                                          controllerHome.listSoal.length - 1
                                      ? Container(
                                          width: 100,
                                        )
                                      : controllerMahasiswa
                                                  .listJawaban.length <=
                                              indexSoal
                                          ? Container(
                                              width: 100,
                                            )
                                          : ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.blue[900]),
                                              onPressed: () async {
                                                setState(() {
                                                  indexSoal = indexSoal + 1;
                                                  controllerHome.soal.clear();

                                                  print(controllerHome
                                                      .listSoal.length);
                                                  print(indexSoal);
                                                });
                                                await controllerHome
                                                    .setSoal(indexSoal);
                                                setState(() {
                                                  if (controllerMahasiswa
                                                          .listJawaban.length >
                                                      indexSoal) {
                                                    if (controllerMahasiswa
                                                            .listJawaban[
                                                                indexSoal]
                                                            .type ==
                                                        "ganda") {
                                                      valueJawaban =
                                                          controllerMahasiswa
                                                              .listJawaban[
                                                                  indexSoal]
                                                              .jawaban;
                                                    } else {
                                                      _controllerJawaban.text =
                                                          controllerMahasiswa
                                                              .listJawaban[
                                                                  indexSoal]
                                                              .jawaban;
                                                    }
                                                  } else {
                                                    valueJawaban = "";

                                                    _controllerJawaban.text =
                                                        "";
                                                  }
                                                });
                                              },
                                              child: Text('Selanjutnya'))),
                                ],
                              ),
                            ),
                            _info(widget.content),
                            SizedBox(
                              height: 30.0,
                            ),
                            isLoading ? Container() : listsoal(context)
                          ])),
                    ),
                  ],
                ),
              )),
              indexSoal != controllerHome.listSoal.length - 1
                  ? Container()
                  : controllerMahasiswa.listJawaban.length ==
                          controllerHome.listSoal.length
                      ? Container()
                      : _renderNextButton()
            ])));
  }

  // Widget listsoal(BuildContext context) {
  //   return Obx(() => Column(
  //       children: controllerHome.listSoal
  //           .map((e) => _soal(
  //               soal: e.text,
  //               type: e.soalType,
  //               opsiA: e.opsiA,
  //               opsiB: e.opsiB,
  //               opsiC: e.opsiC,
  //               opsiD: e.opsiD))
  //           .toList()));
  // }

  Widget listsoal(BuildContext context) {
    return Obx(() => Column(children: [
          _soal(
              soal: controllerHome.soal[0].text,
              type: controllerHome.soal[0].soalType,
              opsiA: controllerHome.soal[0].opsiA,
              opsiB: controllerHome.soal[0].opsiB,
              opsiC: controllerHome.soal[0].opsiC,
              opsiD: controllerHome.soal[0].opsiD)
        ]));
  }

  Widget _avatar() {
    return Container(
      child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            // height: 150,
            margin: EdgeInsets.all(20),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(widget.image),
            ),
          )),
    );
  }

  Widget _info(content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _text(content, Colors.black, 15.0, FontWeight.w500),
          // Divider(
          //   thickness: 5,
          //   indent: 0,
          //   // endIndent: 10,
          //   color: Colors.black.withOpacity(0.2),
          // ),
        ],
      ),
    );
  }

  Widget _text(text, color, size, weight) {
    return Text(text,
        style: TextStyle(color: color, fontSize: size, fontWeight: weight));
  }

  Widget _soal({
    required String soal,
    required String type,
    required String opsiA,
    required String opsiB,
    required String opsiC,
    required String opsiD,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.grey,
          )),
      child: Column(children: [
        SizedBox(
          height: 20.0,
        ),
        Center(child: _text(soal, Colors.black, 15.0, FontWeight.w500)),
        SizedBox(
          height: 20.0,
        ),
        Column(
            children: controllerHome.listJawaban
                .map((e) => Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(e.userId), Html(data: e.jawaban)]),
                    ))
                .toList())
      ]),
    );
  }

  Widget _renderNextButton() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: MediaQuery.of(context).viewInsets.bottom < 200
            ? Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                          width: 2, color: Colors.grey.withOpacity(0.5)),
                    )),
                // margin: EdgeInsets.symmetric(horizontal: 0, vertical: 300),
                width: double.infinity,
                child: AButtonPrimary(
                  label: 'Kirim Tugas',
                  color: Colors.yellow[900],
                  onTap: () async {
                    await controllerMahasiswa.kirimJawaban();
                    // _login();
                    // _mySelection == 'Dosen'
                    //     ? Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => TabHomeDosen()))
                    //     : Navigator.pushReplacement(context,
                    //         MaterialPageRoute(builder: (context) => TabHome()));
                  },
                ))
            : Container());
  }
}
