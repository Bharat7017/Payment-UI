// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:payment_ui/components/color.dart';

class LargeButton extends StatelessWidget {
  final Color? backgrounfColor;
  final Color? textColor;
  final String text;
  final Function()? onTap;
  final bool? isBorer;
  const LargeButton(
      {Key? key,
      this.backgrounfColor = AppColor.mainColor,
      this.textColor,
      this.isBorer = false,
      this.onTap,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(
            color: backgrounfColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.black12)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }
}
