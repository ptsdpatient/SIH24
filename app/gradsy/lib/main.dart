import 'package:flutter/material.dart';
import 'package:gradsy/pages/home_page.dart';
import 'package:gradsy/pages/login_page.dart';
import 'package:gradsy/pages/settings_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Gradsy",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}