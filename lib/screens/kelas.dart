import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molsmobile/controller/controllerKelas.dart';
import 'package:molsmobile/screens/home.dart';
import 'package:molsmobile/screens/profile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ListKelas extends StatefulWidget {
  @override
  _ListKelasState createState() => _ListKelasState();
}

class _ListKelasState extends State<ListKelas> {
  final ControllerKelas controllerKelas = Get.find();

  double fabHeight = 0;
  @override
  void initState() {
    if(controllerKelas.listKelas.isEmpty)
    controllerKelas.getKelasAll();
    super.initState();

    fabHeight = 600;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.white,

      // margin: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Divider(
            thickness: 5,
            indent: 110,
            endIndent: 110,
            color: Colors.orange[200],
          ),
          SizedBox(
            height: 40.0,
          ),
          Expanded(
              child: ListView(children: [
            listPost(context),
            // 
          ])),
        ],
      ),
    ));
  }

  Widget listPost(BuildContext context) {
    return Obx(() => Column(
        children: controllerKelas.listKelas
            .map((e) => _kelas(
                e.name, 'assets/algoritma.jpg', e.type, e.kode, e.year, e.description))
            .toList()));
  }

}

Widget _kelas(title, image, type, kode, year, desc) {
  return Stack(
    children: [
      Container(
          // height: 150,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 20, bottom: 20, left: 70, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue[900],
              border: Border.all(
                width: 2,
                color: Colors.grey,
              )),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    // width: 100,
                    child: Flexible(
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(type,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                        // SizedBox(
                        //   width: 70,
                        // ),
                        Text(year,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(kode,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                        // SizedBox(
                        //   width: 70,
                        // ),
                        Text(desc,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                      ],
                    ),
                  ],
                ))),
              ],
            ),
            // Text('content'),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 120,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.meeting_room),
                        Text('Kelas'),
                      ],
                    )),
              ),
            ),
          ])),
      Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 150,
            margin: EdgeInsets.all(20),
            child:
                // CircleAvatar(
                //   radius: 60,
                //   backgroundColor: Colors.brown.shade800,
                //   child: Text('AH'),
                // )
                CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(image),
            ),
          )),
    ],
  );
}

final planetCard = new Container(
  height: 124.0,
  margin: new EdgeInsets.only(left: 46.0),
  decoration: new BoxDecoration(
    color: new Color(0xFF333366),
    shape: BoxShape.rectangle,
    borderRadius: new BorderRadius.circular(8.0),
    boxShadow: <BoxShadow>[
      new BoxShadow(
        color: Colors.black12,
        blurRadius: 10.0,
      ),
    ],
  ),
);

final planetThumbnail = new Container(
    margin: new EdgeInsets.symmetric(vertical: 16.0),
    alignment: FractionalOffset.centerLeft,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: CircleAvatar(
          backgroundColor: Colors.brown.shade800,
          child: Text('AH'),
        )
        // Image.asset(
        //   'assets/avatar.jpg',
        //   fit: BoxFit.cover,
        //   width: 100,
        // ),
        )
    // new Image(
    //   image: new AssetImage("assets/avatar.jpg"),
    //   height: 92.0,
    //   width: 92.0,
    // ),
    );
