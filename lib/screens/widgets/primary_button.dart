import 'package:flutter/material.dart';

class AButtonPrimary extends StatelessWidget {
  final String? label;
  final Color? color;
  final Color? labelColor;
  final Function()? onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const AButtonPrimary(
      {Key? key,
      this.label,
      this.color,
      this.onTap,
      this.padding,
      this.width,
      this.height,
      this.labelColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
          height: height ?? 44,
          width: width,
          padding: padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color ?? Colors.blue,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            '$label',
            style: TextStyle(
                color: labelColor ?? Colors.white, fontWeight: FontWeight.w500),
          )),
    );
  }
}
