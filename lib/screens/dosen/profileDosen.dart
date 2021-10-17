import 'package:flutter/material.dart';
import 'package:molsmobile/screens/dosen/edit_profile_dosen.dart';
import 'package:molsmobile/screens/login.dart';
import 'package:molsmobile/screens/widgets/appbar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProfileDosen extends StatefulWidget {
  @override
  _ProfileDosenState createState() => _ProfileDosenState();
}

class _ProfileDosenState extends State<ProfileDosen> {
  double fabHeight = 0;
  @override
  void initState() {
    super.initState();

    fabHeight = 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      CustomAppbar(),
      SlidingUpPanel(
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
                      height: 10.0,
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ListView(children: [
                            _profileDosen(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.indigo[900]),
                                    onPressed: () {},
                                    child: Text('Lihat Nilai')),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.yellow[900]),
                                    onPressed: () { Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditProfileDosenPage()));},
                                    child: Text('Edit Profil')),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red[900]),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: Text('Logout')),
                              ],
                            ),
                            _info('Nip', '3424341615015012'),
                            _info('Nama', 'Asep'),
                            _info('Telepon', '082353092323'),
                            _info('Alamat', 'Jl.Swadaya '),
                            _info('Email', 'asep@gmail.com'),
                            _info('Status', 'Dosen'),
                            Text(''),
                            SizedBox(
                              height: 30.0,
                            ),
                          ])),
                    ),
                  ],
                ),
              )),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
          onPanelSlide: (double pos) => setState(() {
                fabHeight = 320;
              }),
          body: Text(''))
    ]));
  }

  Widget _profileDosen() {
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
