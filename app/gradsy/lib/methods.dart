import 'package:flutter/material.dart';

double getWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}

Color getColor(String hexCode) {
  hexCode = hexCode.replaceFirst('#', '');
  return Color(int.parse('0xff$hexCode'));
}