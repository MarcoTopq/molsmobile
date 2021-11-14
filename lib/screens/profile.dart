import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molsmobile/controller/controllerMahasiswa.dart';
import 'package:molsmobile/screens/edit_profile.dart';
import 'package:molsmobile/screens/home.dart';
import 'package:molsmobile/screens/kelas.dart';
import 'package:molsmobile/screens/list_nilai.dart';
import 'package:molsmobile/screens/login.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ControllerMahasiswa controllerMahasiswa =
      Get.find<ControllerMahasiswa>();

  double fabHeight = 0;
  @override
  void initState() {
    super.initState();

    fabHeight = 700;
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
            height: 10.0,
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(children: [
                  _profile(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         primary: Colors.indigo[900]),
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => ListNilai()));
                      //     },
                      //     child: Text('Lihat Nilai')),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         primary: Colors.yellow[900]),
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => EditProfilePage()));
                      //     },
                      //     child: Text('Edit Profil')),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red[900]),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text('Logout')),
                    ],
                  ),
                  Obx(() => _info('Nim', controllerMahasiswa.nim.value)),
                  Obx(() => _info('Nama', controllerMahasiswa.name.value)),
                  Obx(() => _info('Telepon', controllerMahasiswa.phone.value)),
                  // _info('Alamat', controllerMahasiswa.),
                  Obx(() => _info('Email', controllerMahasiswa.email.value)),
                  Obx(() => _info(
                      'Angkatan', controllerMahasiswa.academicYear.value)),
                  Text(''),
                  SizedBox(
                    height: 30.0,
                  ),
                ])),
          ),
        ],
      ),
    ));
  }

  Widget _appbar() {
    return Container(
        // height: 200,
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20),),
            color: Colors.orange[200],
            border: Border.all(
              width: 2,
              color: Colors.grey.withOpacity(0.5),
            )),
        padding: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.person),
                        Text('Profil'),
                      ],
                    )),
                ElevatedButton(
                    onPressed: () async {
                      setState(() async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.home),
                        Text('Beranda'),
                      ],
                    )),
                ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ListKelas()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.meeting_room),
                        Text('Kelas'),
                      ],
                    )),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 200),
                child: SizedBox(
                  height: 100,
                  child: Image.asset('assets/avatar.jpg'),
                ))
          ],
        ));
  }

  Widget _profile() {
    return Container(
      child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            // height: 150,
            margin: EdgeInsets.all(20),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/planet.jpg'),
            ),
          )),
    );
  }

  Widget _info(title, content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _text(title, Colors.black.withOpacity(0.5), 15.0, FontWeight.normal),
          _text(content, Colors.black, 25.0, FontWeight.w500),
          Divider(
            thickness: 5,
            indent: 0,
            // endIndent: 10,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  Widget _text(text, color, size, weight) {
    return Text(text,
        style: TextStyle(color: color, fontSize: size, fontWeight: weight));
  }
}
