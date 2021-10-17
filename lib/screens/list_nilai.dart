import 'package:flutter/material.dart';

class ListNilai extends StatefulWidget {
  @override
  _ListNilaiState createState() => _ListNilaiState();
}

class _ListNilaiState extends State<ListNilai> {
  double? fabHeight;
  @override
  void initState() {
    super.initState();
    fabHeight = 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Nilai'), centerTitle: true,),
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
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: <DataColumn>[
                                  DataColumn(label: Text("Mata Kuliah")),
                                  DataColumn(label: Text("Tugas")),
                                  DataColumn(label: Text("Nilai")),
                                ],
                                rows: <DataRow>[
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(
                                          "Algoritma & Pemrograman Dasar")),
                                      DataCell(Text("Tugas 1")),
                                      DataCell(Text("79")),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text("Bahasa Inggris")),
                                      DataCell(Text("Tugas 1")),
                                      DataCell(Text("77")),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text("Kalkulus Dasar")),
                                      DataCell(Text("Tugas 1")),
                                      DataCell(Text("62")),
                                    ],
                                  ),
                                ],
                              ))),
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

  Widget _text(text, color, size, weight) {
    return Text(text,
        style: TextStyle(color: color, fontSize: size, fontWeight: weight));
  }
}
