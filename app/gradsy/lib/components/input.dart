import 'package:flutter/material.dart';

import '../methods.dart';

Widget InputButton(BuildContext context,double w,String label){
  return
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child:
      Container(
        width: w,
        decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [getColor("#4d88e0"),getColor("#bd85e0")]),
            boxShadow: const [BoxShadow(color: Colors.white70, blurRadius: 2, spreadRadius: 1)]
        ),child:Padding(
        padding: EdgeInsets.only(left: 20),
        child:TextField(
          cursorColor: Colors.pink,
          decoration:InputDecoration(
              labelText: label,
              border: InputBorder.none,
              labelStyle:const TextStyle(color: Colors.white)
          )
      ),)
    )
  );
}