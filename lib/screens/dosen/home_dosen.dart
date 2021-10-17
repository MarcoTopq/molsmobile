import 'package:flutter/material.dart';
import 'package:molsmobile/screens/dosen/detail_post_dosen.dart';
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
//       home: HomeDosen(),
//     );
//   }
// }

class HomeDosen extends StatefulWidget {
  @override
  _HomeDosenState createState() => _HomeDosenState();
}

class _HomeDosenState extends State<HomeDosen> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  var menu;
  @override
  void initState() {
    menu = 1;
    super.initState();

    _fabHeight = 700;
  }

  @override
  Widget build(BuildContext context) {
    return
        // _appbar(),
        SlidingUpPanel(
      maxHeight: 500,
      minHeight: 120,
      parallaxOffset: .5,
      panelBuilder: (sc) => _panel(sc),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
      onPanelSlide: (double pos) => setState(() {}),
      body: SlidingUpPanel(
        maxHeight: 700,
        minHeight: _fabHeight,
        parallaxEnabled: true,
        parallaxOffset: .5,
        // panelBuilder: (sc) => _panel(sc),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        onPanelSlide: (double pos) => setState(() {
          _fabHeight = 320;
          // _fabHeight =
          //     pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
        }),
        panelBuilder: (sc) => Center(
            child: Container(
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
                // SizedBox(
                //   height: 60.0,
                // ),
                _post('Tugas Kalkulus Dasar', '02-06-2021',
                    'Kerjakan soal-soal yang terdapat pada file yang terkirim', 'assets/kalkulus.png'),
                _post('Tugas Algoritma Dasar', '03-06-2021',
                    'Buatlah sebuah algoritma dengan case bunuh diri','assets/web.jpg'),
                _post('Kuis Basis Data', '04-06-2021',
                    'Kerjakan soal-soal yang terdapat pada file yang terkirim','assets/basdat.jpg'),

                SizedBox(
                  height: 230.0,
                ),
              ])),
            ],
          ),
        )),
      ),
    );
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

  Widget _post(title, time, content, image) {
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
              Column(
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
                  Text(time,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 12)),
                ],
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
                  style: ElevatedButton.styleFrom(primary: Colors.blue[900]),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPostDosen(
                                  title: title,
                                  time: time,
                                  content: content,
                                  image: image,
                                )));
                  },
                  child: Text('Detail')),
            ],
          ),
        ]));
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
