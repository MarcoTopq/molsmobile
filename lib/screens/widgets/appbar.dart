import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1000,
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20),),
            color: Colors.blue,
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
            //     ElevatedButton(
            //         onPressed: () {
            //           Navigator.pushReplacement(context,
            //               MaterialPageRoute(builder: (context) => Profile()));
            //         },
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: [
            //             Icon(Icons.person),
            //             Text('Profil'),
            //           ],
            //         )),
            //     ElevatedButton(
            //         onPressed: () {
            //           Navigator.pushReplacement(context,
            //               MaterialPageRoute(builder: (context) => HomePage()));
            //         },
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: [
            //             Icon(Icons.home),
            //             Text('Beranda'),
            //           ],
            //         )),
            //     ElevatedButton(
            //         onPressed: () {
            //           Navigator.pushReplacement(context,
            //               MaterialPageRoute(builder: (context) => ListKelas()));
            //         },
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: [
            //             Icon(Icons.meeting_room),
            //             Text('Kelas'),
            //           ],
            //         )),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 200),
                child: SizedBox(
                  height: 100,
                  child: Image.asset('assets/unmul.png'),
                ))
          ],
        ));
  }
}
