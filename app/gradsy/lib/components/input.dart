import 'package:flutter/material.dart';

import '../methods.dart';

class Input extends StatefulWidget{
  final bool obscure;
  final double width;
  final String label;
  const Input ({
    Key? key,
    required this.label,
    required this.obscure,
    required this.width,

  }) : super(key: key);
  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool obscure = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscure=!widget.obscure;
  }

  @override
  Widget build(BuildContext context){
    return
      Padding(
          padding: const EdgeInsets.only(top:15),
          child:
          Container(
              width: widget.width*0.9,
              decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(colors: [getColor("4d88e0"),getColor("bd85e0")]),
                  boxShadow: const [BoxShadow(color: Colors.white70, blurRadius: 2, spreadRadius: 1)]
              ),child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                  child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextField(
                            scrollPhysics: BouncingScrollPhysics(),
                            obscureText: obscure,

                            style: TextStyle(color: Colors.black),
                            cursorColor: getColor("4d88e0"),
                            decoration:InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                suffixIcon:widget.obscure?Padding(padding: EdgeInsets.only(right:10),child: IconButton(onPressed: (){
                                    setState(() {
                                      obscure=!obscure;
                                    });
                                  }, icon: Icon(Icons.remove_red_eye,color: getColor("4d88e0"),)),):null,
                                labelText: widget.label,
                                border: InputBorder.none,
                                labelStyle:TextStyle(color: getColor("4d88e0"))
                            )
                        ),
                      )
          )
          )
      );
  }
}