import 'package:flutter/material.dart';

class LoadIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: 0.5,
      color: Colors.blue,
      strokeWidth: 5,
      backgroundColor: Colors.transparent,
    );
  }
}