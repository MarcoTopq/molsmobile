import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingIndicator({Color? color}) {
  return Container(
    child: SpinKitFadingCircle(
      size: 35,
      duration: Duration(seconds: 3),
      color: Colors.blue,
    ),
  );
}
