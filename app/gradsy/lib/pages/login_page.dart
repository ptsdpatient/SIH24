import 'package:flutter/material.dart';
import 'package:gradsy/components/input.dart';

import '../methods.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override

  Widget build(BuildContext context){
    double w= getWidth(context);
    double h= getHeight(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Center Text"),
                InputButton(context, w, "username"),

              ],
            )
          )
    );
  }
}