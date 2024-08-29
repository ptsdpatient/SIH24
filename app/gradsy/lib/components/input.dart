import 'package:flutter/material.dart';

import '../methods.dart';

Widget InputButton(BuildContext context,double w,String label,bool obscure){
  return
    Padding(
      padding: const EdgeInsets.only(top:15),
      child:
      Container(
        width: w*0.9,
        decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [getColor("4d88e0"),getColor("bd85e0")]),
            boxShadow: const [BoxShadow(color: Colors.white70, blurRadius: 2, spreadRadius: 1)]
              ),child:Padding(
                padding: const EdgeInsets.only(left: 20),
                child:
                    TextField(
                        scrollPhysics: BouncingScrollPhysics(),
                        obscureText: obscure,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration:InputDecoration(
                            suffixIcon:obscure?Padding(padding: EdgeInsets.only(right:10),child: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye,color: Colors.white,)),):null,
                            labelText: label,
                            border: InputBorder.none,
                            labelStyle:const TextStyle(color: Colors.white)
                        )
                    ),
            )
          )
        );
}