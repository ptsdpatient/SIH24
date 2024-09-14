import 'package:flutter/material.dart';
import 'package:gradsy/theme.dart';

double getWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}

Color getColor(String hexCode) {
  // hexCode = hexCode.replaceFirst('#', '');
  return Color(int.parse('0xff$hexCode'));
}

String primaryBackgroundTheme(){
  if(currentTheme.lightMode) return "ffffff";
  else return "000000";
}

