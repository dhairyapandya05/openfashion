import 'package:flutter/material.dart';

class UiHelper {
  static CustomText(
      {required String text,
      required Color color,
      required fontweight,
      String? fontfamily,
      required double fontsize}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: fontfamily ?? "regular",
          fontWeight: fontweight,
          color: color),
    );
  }


  static CustomImage({required String img}){
    return Image.asset(img);
  }
}
