import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molsmobile/controller/controllerHome.dart';
import 'package:molsmobile/screens/detail_post.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Test Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ControllerHome controllerHome = Get.find<ControllerHome>();

  final double _initFabHeight = 120.0;
  double _fabHeight = 750;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  var menu;

  _getData() {
    if (controllerHome.listPost.length < 1) {
      controllerHome.getPost();
    }
  }

  @override
  void initState() {
    menu = 1;
    super.initState();
    _getData();
    _fabHeight = 700;
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
              child: ListView(
            children: [listPost(context)],
          )),
        ],
      ),
    ));
  }

  Widget listPost(BuildContext context) {
    return Obx(() => Column(
        children: controllerHome.listPost
            .map((e) => _post(
                e.title, e.minutes, e.text, 'assets/basdat.jpg', e.idSoal))
            .toList()));
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(
          children: [
            Column(
              children: [
                Divider(
                  thickness: 5,
                  indent: 110,
                  endIndent: 110,
                  color: Colors.orange[200],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Kelas Anda",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            // Text('Kelas'),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                children: [
                  _kelas('Kalkulus', 'assets/kalkulus.png'),
                  _kelas('Basis Data', 'assets/basdat.jpg'),
                  _kelas('Alpro', 'assets/algoritma.jpg'),
                  _kelas("Web", 'assets/web.jpg'),
                ],
              ),
            )
          ],
        ));
  }

  Widget _button(String label, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration:
              BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 8.0,
            )
          ]),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }

  Widget _post(title, time, content, image, id) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.grey.withOpacity(0.5),
          )),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Text("$time menit",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(content,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.yellow),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPost(
                                title: title,
                                time: time,
                                content: content,
                                image: image,
                                id: id,
                              )));
                },
                child: Text('Detail')),
          ],
        ),
      ]),
    );
  }

  Widget _kelas(title, image) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(
            width: 30,
          ),
          Column(children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ])
        ],
      ),
    );
  }
}
