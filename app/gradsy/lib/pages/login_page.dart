import 'package:flutter/material.dart';
import 'package:gradsy/components/button.dart';
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
      body: SingleChildScrollView(
            child:Container(
              width: w,
              height: h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [getColor("ffffff"),getColor("f1dcff")],
                )
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Login",style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: getColor("4d88e0")
                  )),
                  SizedBox(height:20),
                  Input(
                      width: w,
                      label: "username",
                      obscure: false
                  ),
                  Input(
                      width: w,
                      label: "password",
                      obscure: true
                  ),

                  Button(context, w*0.5, "continue"),

                ],
              ),
            )
          )
    );
  }
}