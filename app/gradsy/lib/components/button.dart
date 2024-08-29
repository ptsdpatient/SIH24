import 'package:flutter/material.dart';

import '../methods.dart';

Widget Button(BuildContext context,double w,String label){
  return Padding(
      padding: const EdgeInsets.only(top:15),
      child:
      Container(
          width: w,
          decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [getColor("4d88e0"),getColor("bd85e0")]),
              boxShadow: const [BoxShadow(color: Colors.white70, blurRadius: 2, spreadRadius: 1)]
          ),  child:Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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