import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:molsmobile/screens/widgets/inputform.dart';
import 'package:molsmobile/screens/widgets/primary_button.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerCode = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  File? files;
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation = ''; // Option 2
  String _mySelection = '';
  FocusNode? myFocusNode;

  var email;
  var name;
  var phone;
  var code;
  var isFilled;

  List<Widget> _buildForm() {
    return [
      RInputPrimary(
        label: 'Judul',
        hintText: 'Masukan Judul',
        controller: _controllerName,
        suffixIcon: Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        prefixIcon: Icon(
          Icons.person_outline,
          color: Colors.lightBlue[900],
        ),
        onChangeText: (value) {
          setState(() {
            name = value;
          });
          // _validateFill();
        },
      ),
      RInputPrimary(
        maxLines: 5,
        label: 'Keterangan',
        hintText: 'Masukan Keterangan',
        controller: _controllerEmail,
        suffixIcon: Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        // prefixIcon: Icon(
        //   Icons.email_outlined,
        //   color: Colors.lightBlue[900],
        // ),
        onChangeText: (value) {
          setState(() {
            email = value;
          });
          // _validateFill();
        },
      ),
      Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: ShapeDecoration(
            color: Colors.grey,
            // color: Colors.blue[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            )),
        child: DropdownButtonFormField<String>(
            focusNode: myFocusNode,
            icon: Icon(Icons.arrow_drop_down_circle),
            iconEnabledColor: Colors.green[900],
            onChanged: (newVal) async {
              // await lurah(newVal.toString());
              setState(() {
                FocusScope.of(context).requestFocus(new FocusNode());
                _mySelection = newVal!;
                // opsis = newVal;

                // print(opsis);
                // print('posisi' + posisi.toString());
              });
            },
            isExpanded: true,
            isDense: true,
            // value: _mySelection,
            hint: Container(
                padding: EdgeInsets.only(left: 0),
                child: Text('Pilih Jenis Tugas')),
            items: _locations?.map((item) {
                  return new DropdownMenuItem<String>(
                    child: Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text(item.toString())),
                    value: item.toString(),
                  );
                })?.toList() ??
                [],
            // ignore: missing_return
            validator: (value) {
              if (value == null) {
                return 'Harap di pilih';
              }
            }),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
            onPressed: () async {
              files = await FilePicker.getFile();
              setState(() {
                // file = 1;
                print(files);
                // print(file);
                // data= null;
              });
            },
            child: Text('Upload File')),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tugas'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[900],
        ),
        body: Stack(children: [
          // CustomAppbar(),
          // MediaQuery.of(context).viewInsets.bottom < 200
          //     ? BgBottom()
          //     : Container(),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: Column(children: [
              Expanded(
                child: ListView(children: [
                  ..._buildForm(),
                  SizedBox(
                    height: 15,
                  ),
                ]),
              ),
              _renderNextButton(),
            ]),
          ),
        ]));
  }

  Widget _renderNextButton() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: MediaQuery.of(context).viewInsets.bottom < 200
            ? Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                          width: 2, color: Colors.grey.withOpacity(0.5)),
                    )),
                // margin: EdgeInsets.symmetric(horizontal: 0, vertical: 300),
                width: double.infinity,
                child: AButtonPrimary(
                    label: 'Tambahkan Tugas', color: Colors.lightBlue[900]
                    // onTap: () {
                    //   Navigation.replaceWithSlideTransition(() => RegisOtp());
                    // },
                    ))
            : Container());
  }
}
