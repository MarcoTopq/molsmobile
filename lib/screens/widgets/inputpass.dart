import 'package:flutter/material.dart';

class RInputPassword extends StatefulWidget {
  final String? hintText;
  final String label;
  final EdgeInsetsGeometry? margin;

  final dynamic validate;
  final dynamic onSaved;
  final Function(String)? onChangeText;
  final Widget? prefixIcon;
  final String? helperText;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;
  RInputPassword({
    required this.label,
    this.hintText,
    this.validate,
    this.onSaved,
    this.onChangeText,
    this.prefixIcon,
    this.helperText,
    this.autovalidateMode,
    this.controller,
    this.margin,
  });

  @override
  RInputPasswordState createState() => RInputPasswordState();
}

class RInputPasswordState extends State<RInputPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 15, left: 20, right: 20),
        margin: widget.margin,
        // padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          widget.label != null
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: 5,
                  ),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : Container(),
          Container(
            decoration: ShapeDecoration(
                color: Colors.grey,
                // color: Colors.blue[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                )),
            child: TextFormField(
              key: Key('password'),
              validator: widget.validate,
              onSaved: widget.onSaved,
              onChanged: widget.onChangeText,
              controller: widget.controller,
              autovalidateMode: widget.autovalidateMode,
              autofocus: false,
              obscureText: _obscureText,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: widget.hintText,
                border: InputBorder.none,
                prefixIcon: widget.prefixIcon,
                helperText: widget.helperText,
                helperStyle: TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: widget.controller!.text == ''
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                suffixIcon: GestureDetector(
                  child: _obscureText
                      ? Icon(
                          Icons.visibility,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                  onTap: onTap,
                ),
              ),
            ),
          )
        ]));
  }

  void onTap() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
