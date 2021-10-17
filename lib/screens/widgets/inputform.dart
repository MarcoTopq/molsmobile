import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RInputPrimary extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validate;
  final dynamic onSaved;
  final Function(String)? onChangeText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? border;
  final EdgeInsetsGeometry? margin;
  final String? initialValue;
  final String label;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final bool? enableInteractiveSelection;
  final AutovalidateMode? autovalidateMode;
  RInputPrimary(
      {this.hintText,
      this.validate,
      this.onSaved,
      this.onChangeText,
      this.prefixIcon,
      this.suffixIcon,
      this.margin,
      this.initialValue,
      this.controller,
      this.keyboardType,
      this.enabled,
      this.inputFormatters,
      required this.label,
      this.onTap,
      this.border,
      this.enableInteractiveSelection,
      this.autovalidateMode, this.maxLines});

  @override
  _RInputPrimaryState createState() => _RInputPrimaryState();
}

class _RInputPrimaryState extends State<RInputPrimary> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 15, left: 20, right: 20),
      margin: widget.margin,
      // padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                color: Colors.grey.withOpacity(0.3),
                // color: Colors.blue[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                )),
            child: TextFormField(
              maxLines: widget.maxLines,
              enableInteractiveSelection:
                  widget.enableInteractiveSelection ?? true,
              onTap: widget.onTap,
              cursorColor: Colors.orange[200],
              enabled: widget.enabled,
              autovalidateMode: widget.autovalidateMode,
              validator: widget.validate,
              onSaved: widget.onSaved,
              onChanged: widget.onChangeText,
              initialValue: widget.initialValue,
              keyboardType: widget.keyboardType,
              autofocus: false,
              controller: widget.controller,
              obscureText: false,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                  fillColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  enabledBorder: widget.controller!.text == ''
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.green, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                  // errorBorder: InputBorder.none,
                  // disabledBorder: InputBorder.none,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon:
                      widget.controller!.text == '' ? null : widget.suffixIcon,
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  void onTap() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
