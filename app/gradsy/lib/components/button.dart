import 'package:flutter/material.dart';
import 'package:gradsy/theme.dart';

import '../methods.dart';

Widget Button(BuildContext context,double w,String label){
  return Padding(
      padding: const EdgeInsets.only(top:20),
      child:
      Container(
          width: w,
          decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(colors: [getColor(currentTheme.gradientStart),getColor(currentTheme.gradientEnd)]),
          ),  child:Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(label,style: const TextStyle(color: Colors.white,fontSize: 17),textAlign: TextAlign.center,),
                  Icon(Icons.arrow_right_alt,color: Colors.white,)
                ],
              )
        ),
      )
  );
}