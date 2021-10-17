import 'package:flutter/material.dart';
import 'package:molsmobile/screens/widgets/inputform.dart';
import 'package:molsmobile/screens/widgets/inputpass.dart';
import 'package:molsmobile/screens/widgets/primary_button.dart';

class EditProfileDosenPage extends StatefulWidget {
  @override
  _EditProfileDosenPageState createState() => _EditProfileDosenPageState();
}

class _EditProfileDosenPageState extends State<EditProfileDosenPage> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerCode = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  var email;
  var name;
  var phone;
  var code;
  var isFilled;

  List<Widget> _buildForm() {
    return [
      RInputPrimary(
        label: 'Nip',
        hintText: 'Nip',
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
        label: 'Nama Lengkap',
        hintText: 'Nama Lengkap',
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
        label: 'Email',
        hintText: 'Email',
        controller: _controllerEmail,
        suffixIcon: Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: Colors.lightBlue[900],
        ),
        onChangeText: (value) {
          setState(() {
            email = value;
          });
          // _validateFill();
        },
      ),
      RInputPrimary(
        label: 'No Handphone',
        hintText: 'No Handphone',
        controller: _controllerPhone,
        suffixIcon: Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        prefixIcon: Icon(
          Icons.phone_android_outlined,
          color: Colors.lightBlue[900],
        ),
        onChangeText: (value) {
          setState(() {
            phone = value;
          });
          // _validateFill();
        },
      ),
      RInputPrimary(
        label: 'Alamat',
        hintText: 'Alamat',
        controller: _controllerCode,
        suffixIcon: Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        prefixIcon: Icon(
          Icons.wallet_membership_outlined,
          color: Colors.lightBlue[900],
        ),
        onChangeText: (value) {
          setState(() {
            code = value;
          });
          // _validateFill();
        },
      ),
     RInputPassword(
        label: 'Password',
        hintText: 'Password',
        // helperText:
        //     '- Password minimal 8 karakter\n- Password kombinasi huruf besar, huruf kecil\n  dan angka',
        controller: _controllerPassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        prefixIcon: Icon(
          Icons.lock,
          color:  Colors.lightBlue[900],
        ),
        onChangeText: (value) {
          setState(() {
            // password = value;
          });
          // _validateFill();
        },
     )];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update'),
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
                    label: 'Update', color: Colors.lightBlue[900]
                    // onTap: () {
                    //   Navigation.replaceWithSlideTransition(() => RegisOtp());
                    // },
                    ))
            : Container());
  }
}


