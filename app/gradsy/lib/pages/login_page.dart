import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gradsy/components/button.dart';
import 'package:gradsy/components/input.dart';
import 'package:gradsy/global_data.dart';
import 'package:gradsy/theme.dart';

import '../components/login.dart';
import '../methods.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    double w= getWidth(context);
    double h= getHeight(context);
    return Scaffold(
        body:SingleChildScrollView(
            child:Container(
                width: w,
                height: h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [getColor(userTheme.modeBG()),getColor(userTheme.getGradient())],
                    )
                ),
                child:DefaultTabController(length: 2, initialIndex: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: w,
                          height: 230,
                          margin: EdgeInsets.only(top:30,bottom: 10),
                          decoration: BoxDecoration(
                              gradient: GlobalData.instance.lightMode || GlobalData.instance.theme=="Zen"?
                              RadialGradient(colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.75),
                                Colors.white.withOpacity(0.5),
                                Colors.white.withOpacity(0)
                              ]):

                              RadialGradient(colors: [
                                getColor(currentTheme.gradientStart),
                                getColor(currentTheme.gradientStart).withOpacity(0.75),
                                getColor(currentTheme.gradientStart).withOpacity(0.5),
                                getColor(currentTheme.gradientStart).withOpacity(0),
                              ])
                          ),
                          child:Padding(
                            padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child:Image.asset("images/icon.png"),
                          ),
                        ),

                        TabBar(
                            indicatorPadding: EdgeInsets.only(top: 25),
                            dividerColor: Colors.transparent,
                            indicatorColor: getColor(currentTheme.gradientStart),
                            labelColor: getColor(userTheme.textMode()),
                            unselectedLabelColor: getColor(userTheme.textMode()).withOpacity(0.5),
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(icon: Text("Login",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              ),
                              Tab(icon: Text("Register",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              )
                            ]),
                        Expanded(
                            child: TabBarView(children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Input(
                                        width: w,
                                        label: "email",
                                        obscure: false
                                    ),
                                    Input(
                                        width: w,
                                        label: "password",
                                        obscure: true
                                    ),
                                    Button(context, w*0.5, "continue"),

                                    SizedBox(height: 20),

                                    Padding(padding: EdgeInsets.symmetric(vertical:20),
                                        child:Text("or login with",style: TextStyle(color: getColor(userTheme.textMode())))
                                    ),

                                    Padding(padding: EdgeInsets.symmetric(horizontal : 30) ,
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            LoginButton(
                                              url: "google",
                                              width: w*0.18,
                                            ),
                                            LoginButton(
                                              url: "linkedin",
                                              width: w*0.18,
                                            ),
                                            LoginButton(
                                              url: "apple",
                                              width: w*0.18,
                                            )
                                          ],
                                        )
                                    )

                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Input(
                                        width: w,
                                        label: "name",
                                        obscure: false
                                    ),
                                    Input(
                                        width: w,
                                        label: "email",
                                        obscure: false
                                    ),
                                    Input(
                                        width: w,
                                        label: "password",
                                        obscure: true
                                    ),
                                    Input(
                                        width: w,
                                        label: "confirm password",
                                        obscure: true
                                    ),

                                    Button(context, w*0.5, "Sign Up"),





                                  ]),
                            ]
                            )
                        )
                      ],
                    )

                )
            )
        )
    );
  }
}