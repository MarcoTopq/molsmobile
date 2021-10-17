import 'package:flutter/material.dart';
import 'package:molsmobile/screens/dosen/edit_post.dart';

class DetailPostDosen extends StatefulWidget {
  final String? title;
  final String? time;
  final String? content;
  final String image;

  const DetailPostDosen(
      {Key? key, this.title, this.time, this.content, required this.image})
      : super(key: key);
  @override
  _DetailPostDosenState createState() => _DetailPostDosenState();
}

class _DetailPostDosenState extends State<DetailPostDosen> {
  double? fabHeight;
  @override
  void initState() {
    super.initState();

    fabHeight = 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Post'),
          centerTitle: true,
        ),
        body: Stack(children: <Widget>[
          // CustomAppbar(),
          // SlidingUpPanel(
          //     maxHeight: 600,
          //     minHeight: fabHeight,
          //     parallaxOffset: .5,
          //     panelBuilder: (sc) =>
          Center(
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
                  height: 10.0,
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(children: [
                        Row(
                          children: [
                            _avatar(),
                            _text(widget.title, Colors.black, 20.0,
                                FontWeight.bold)
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _text("Nama Dosen", Colors.black, 15.0,
                                FontWeight.normal),
                            _text(widget.time, Colors.black, 15.0,
                                FontWeight.normal),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.indigo[900]),
                                  onPressed: () {},
                                  child: Text('Lihat Jawaban')),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red[900]),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EditPost()));
                                  },
                                  child: Text('Edit Tugas')),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green[900]),
                                  onPressed: () {},
                                  child: Text('Mahasiswa')),
                            ],
                          ),
                        ),
                        _info(widget.content),
                        SizedBox(
                          height: 30.0,
                        ),
                      ])),
                ),
              ],
            ),
          )),
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
          // onPanelSlide: (double pos) => setState(() {
          //       fabHeight = 320;
          //     }),
          // body: Text(''))
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
}
