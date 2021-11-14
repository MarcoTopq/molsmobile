import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:molsmobile/controller/controllerMahasiswa.dart';
import 'package:molsmobile/main.dart';
import 'package:molsmobile/screens/loading.dart';
import 'package:molsmobile/screens/widgets/inputform.dart';
import 'package:molsmobile/screens/widgets/inputpass.dart';
import 'package:molsmobile/screens/widgets/primary_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerNim = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerCode = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  final ControllerMahasiswa controllerMahasiswa =
      Get.find<ControllerMahasiswa>();

  var email;
  var name;
  var phone;
  var code;
  var isFilled;
  FocusNode? myFocusNode;
  String _mySelection = '';
  List role = ['Dosen', 'Mahasiswa'];
  bool isLoading = false;
  bool validate = false;
  _onLoading() {
    setState(() {
      isLoading = true;
    });
  }

  _offLoading() {
    setState(() {
      isLoading = false;
    });
  }

  _login() async {
    _onLoading();
    try {
      await controllerMahasiswa
          .login(
              userid: _controllerNim.text, password: _controllerPassword.text)
          .then((value) async => {
                _offLoading(),
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => TabHome()))
              });
    } on Exception catch (e) {
      _offLoading();
      Get.snackbar('Warning', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  List<Widget> _buildForm() {
    return [
      RInputPrimary(
        label: 'NIM',
        hintText: 'NIM',
        controller: _controllerNim,
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
            email = value;
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
          color: Colors.lightBlue[900],
        ),
        onChangeText: (value) {
          setState(() {
            // password = value;
          });
          // _validateFill();
        },
      ),
      // Container(
      //   margin: EdgeInsets.all(20),
      //   padding: EdgeInsets.symmetric(horizontal: 20),
      //   decoration: ShapeDecoration(
      //       color: Colors.grey,
      //       // color: Colors.blue[900],
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.all(
      //           Radius.circular(10),
      //         ),
      //       )),
      //   child: DropdownButtonFormField<String>(
      //       focusNode: myFocusNode,
      //       icon: Icon(Icons.arrow_drop_down_circle),
      //       iconEnabledColor: Colors.green[900],
      //       onChanged: (newVal) async {
      //         // await lurah(newVal.toString());
      //         setState(() {
      //           FocusScope.of(context).requestFocus(new FocusNode());
      //           _mySelection = newVal!;
      //           // opsis = newVal;

      //           // print(opsis);
      //           // print('posisi' + posisi.toString());
      //         });
      //       },
      //       isExpanded: true,
      //       isDense: true,
      //       // value: _mySelection,
      //       hint: Container(
      //           padding: EdgeInsets.only(left: 0), child: Text('Pilih role')),
      //       items: role?.map((item) {
      //             return new DropdownMenuItem<String>(
      //               child: Padding(
      //                   padding: EdgeInsets.only(left: 40),
      //                   child: Text(item.toString())),
      //               value: item.toString(),
      //             );
      //           })?.toList() ??
      //           [],
      //       // ignore: missing_return
      //       validator: (value) {
      //         if (value == null) {
      //           return 'Harap di pilih';
      //         }
      //       }),
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.yellow,
        ),
        body: LoadingOverlay(
            isLoading: isLoading,
            progressIndicator: loadingIndicator(),
            child: Stack(children: [
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
            ])));
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
                  label: 'Login',
                  color: Colors.orange,
                  onTap: () {
                    _login();
                    // _mySelection == 'Dosen'
                    //     ? Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => TabHomeDosen()))
                    //     : Navigator.pushReplacement(context,
                    //         MaterialPageRoute(builder: (context) => TabHome()));
                  },
                ))
            : Container());
  }
}
