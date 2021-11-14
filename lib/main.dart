import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molsmobile/api/api2.dart';
import 'package:molsmobile/controller/controllerHome.dart';
import 'package:molsmobile/controller/controllerKelas.dart';
import 'package:molsmobile/controller/controllerMahasiswa.dart';
import 'package:molsmobile/screens/dosen/home_dosen.dart';
import 'package:molsmobile/screens/dosen/list_kelas_dosen.dart';
import 'package:molsmobile/screens/dosen/profileDosen.dart';
import 'package:molsmobile/screens/home.dart';
import 'package:molsmobile/screens/kelas.dart';
import 'package:molsmobile/screens/login.dart';
import 'package:molsmobile/screens/profile.dart';
import 'package:molsmobile/screens/widgets/appbar.dart';

var nim;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  nim = await Api2().getUserNim();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ControllerMahasiswa());
    Get.put(ControllerHome());
    Get.put(ControllerKelas());
    return MaterialApp(
      title: 'Test Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: nim != null ? LoginPage() : TabHome(),
    );
  }
}

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.yellow,
              bottomOpacity: 0.0,
              elevation: 0.0,
              shadowColor: Colors.yellow,
              title: TabBar(
                indicatorPadding: EdgeInsets.all(0),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.person),
                        Text('Profil'),
                      ],
                    )),
                  ),
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.home),
                        Text('Beranda'),
                      ],
                    )),
                  ),
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.meeting_room),
                        Text('Kelas'),
                      ],
                    )),
                  ),
                ],
              )),
          body: Stack(
            children: [
              CustomAppbar(),
              TabBarView(
                children: [Profile(), HomePage(), ListKelas()],
              ),
            ],
          ),
        ));
  }
}

class TabHomeDosen extends StatefulWidget {
  @override
  _TabHomeDosenState createState() => _TabHomeDosenState();
}

class _TabHomeDosenState extends State<TabHomeDosen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.yellow,
              bottomOpacity: 0.0,
              elevation: 0.0,
              shadowColor: Colors.yellow,
              title: TabBar(
                indicatorPadding: EdgeInsets.all(0),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.person),
                        Text('Profil'),
                      ],
                    )),
                  ),
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.home),
                        Text('Beranda'),
                      ],
                    )),
                  ),
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.meeting_room),
                        Text('Kelas'),
                      ],
                    )),
                  ),
                ],
              )),
          body: Stack(
            children: [
              CustomAppbar(),
              TabBarView(
                children: [ProfileDosen(), HomeDosen(), ListKelasDosen()],
              ),
            ],
          ),
        ));
  }
}
