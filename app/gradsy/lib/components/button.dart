import 'package:flutter/material.dart';
import 'package:gradsy/theme.dart';

import '../global_data.dart';
import '../methods.dart';

Widget Button(BuildContext context,double w,String label,Future<void> Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
        padding: const EdgeInsets.only(top:23),
        child: Container(
          width: w,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(25),
            gradient: !GlobalData.instance.lightMode &&GlobalData.instance.theme=="Zen"? LinearGradient(colors: [Colors.white,Colors.white]):LinearGradient(colors: [getColor(currentTheme.gradientStart),getColor(currentTheme.gradientEnd)]),
          ),  child:Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(label,style: TextStyle(color: !GlobalData.instance.lightMode &&GlobalData.instance.theme=="Zen"?Colors.black:Colors.white,fontSize: 17),textAlign: TextAlign.center,),
                Icon(Icons.arrow_right_alt,color: !GlobalData.instance.lightMode &&GlobalData.instance.theme=="Zen"?Colors.black:Colors.white,)
              ],
            )
          ),
        )
    ),
  );
}