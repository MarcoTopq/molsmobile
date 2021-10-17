import 'package:flutter/material.dart';
import 'package:molsmobile/screens/home.dart';
import 'package:molsmobile/screens/profile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class ListKelas extends StatefulWidget {
  @override
  _ListKelasState createState() => _ListKelasState();
}

class _ListKelasState extends State<ListKelas> {
  double fabHeight = 0;
  @override
  void initState() {
    super.initState();

    fabHeight = 600;
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        maxHeight: 600,
        minHeight: fabHeight,
        parallaxOffset: .5,
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
                    Container(
                      child: Stack(
                        children: [
                          _kelas('Pengembangan dan Pemrograman web',
                              'assets/web.jpg'),
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          _kelas('Algoritma dan Pemrograman Dasar',
                              'assets/algoritma.jpg'),
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          _kelas('Basis Data', 'assets/basdat.jpg'),
                        ],
                      ),
                    ),
                    Text(''),
                    SizedBox(
                      height: 130.0,
                    ),
                  ])),
                ],
              ),
            )),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        onPanelSlide: (double pos) => setState(() {
              fabHeight = 320;
            }),
        body: Text(''));
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.person),
                        Text('Profil'),
                      ],
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.home),
                        Text('Beranda'),
                      ],
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
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
                  child: Image.asset('assets/web.jpg'),
                ))
          ],
        ));
  }
}

Widget _kelas(title, image) {
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
                        Text('Ganjil',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                        // SizedBox(
                        //   width: 70,
                        // ),
                        Text('2021',
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
                        Text('PW',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                        // SizedBox(
                        //   width: 70,
                        // ),
                        Text('6 sks',
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
                        Text('Gabung'),
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
