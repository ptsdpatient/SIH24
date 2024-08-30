import 'package:flutter/material.dart';

import '../methods.dart';
import '../theme.dart';

class LoginButton extends StatefulWidget{
  final String url;
  final double width;
  const LoginButton ({
    Key? key,
    required this.url,
    required this.width,
  }) : super(key: key);
  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {


  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          width: widget.width,
          height: widget.width,
          color: Colors.white,
          child: Image.asset("images/${widget.url}.png"),
      ),
    );
  }
}