import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gradsy/components/button.dart';
import 'package:gradsy/components/input.dart';
import 'package:gradsy/global_data.dart';
import 'package:gradsy/theme.dart';
import 'package:http/http.dart' as http;
import '../components/login.dart';
import '../methods.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  final apiKey=dotenv.env['API_KEY']!;

  TextEditingController emailController = TextEditingController(), passwordController = TextEditingController(), collegeCodeController = TextEditingController(),confirmPasswordController = TextEditingController();

  Future<void> loginUser(String email, String password) async {
    final url = Uri.parse(apiKey+'login');

    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print('Login successful: ${response.body}');
        Navigator.pushNamed(context, '/home');
      } else {
        print('Login failed: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      print('Error occurred: $error');
    }
  }


  Future<void> registerUser(String email, String password,String confirmPassword,String collegeCode) async {
    final url = Uri.parse('http://localhost:3000/login');

    final body = jsonEncode({
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
      'college_code': collegeCode,
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print('Login successful: ${response.body}');
        Navigator.pushNamed(context, '/home');
      } else {
        print('Login failed: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      print('Error occurred: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    double h = getHeight(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                getColor(userTheme.modeBG()),
                getColor(userTheme.getGradient()),
              ],
            ),
          ),
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: w,
                  height: 230,
                  margin: EdgeInsets.only(top: 40, bottom: 10),
                  decoration: BoxDecoration(
                    gradient: GlobalData.instance.lightMode ||
                        GlobalData.instance.theme == "Zen"
                        ? RadialGradient(
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.75),
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0),
                      ],
                    )
                        : RadialGradient(
                      colors: [
                        getColor(currentTheme.gradientStart),
                        getColor(currentTheme.gradientStart)
                            .withOpacity(0.75),
                        getColor(currentTheme.gradientStart)
                            .withOpacity(0.5),
                        getColor(currentTheme.gradientStart).withOpacity(0),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Image.asset("images/icon.png"),
                  ),
                ),
                TabBar(
                  indicatorPadding: EdgeInsets.only(top: 25),
                  dividerColor: Colors.transparent,
                  indicatorColor: getColor(currentTheme.gradientStart),
                  labelColor: getColor(userTheme.textMode()),
                  unselectedLabelColor:
                  getColor(userTheme.textMode()).withOpacity(0.5),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      icon: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Input(
                            controller: emailController,
                            width: w,
                            label: "email",
                            obscure: false,
                          ),
                          Input(
                            controller: passwordController,
                            width: w,
                            label: "password",
                            obscure: true,
                          ),

                          IconButton(onPressed:(){
                            Navigator.pushNamed(context, "/home");
                            },
                            icon: Button(context, w * 0.5, "continue",
                                  () async {
                                await loginUser(emailController.text, passwordController.text);
                              },                            ),
                          ),

                          SizedBox(height: 0),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 20),
                            child: Text(
                              "or login with",
                              style:
                              TextStyle(color: getColor(userTheme.textMode())),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                LoginButton(
                                  id: 0,
                                  url: "google",
                                  width: w * 0.17,
                                ),
                                LoginButton(
                                  id: 1,
                                  url: "linkedin",
                                  width: w * 0.17,
                                ),
                                LoginButton(
                                  id: 2,
                                  url: "github",
                                  width: w * 0.17,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Input(
                            controller: emailController,
                            width: w,
                            label: "email",
                            obscure: false,
                          ),
                          Input(
                            controller: collegeCodeController,
                            width: w,
                            label: "college code",
                            obscure: false,
                          ),
                          Input(
                            controller: passwordController,
                            width: w,
                            label: "password",
                            obscure: true,
                          ),
                          Input(
                            controller: confirmPasswordController,
                            width: w,
                            label: "confirm password",
                            obscure: true,
                          ),
                          Button(
                              context, w * 0.5, "Sign Up",
                              () async {
                              await registerUser(emailController.text, passwordController.text, confirmPasswordController.text, collegeCodeController.text) as Future<void> Function();
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
