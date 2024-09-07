import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Message{

  final String title;
  final String message;
  final IconData icon;
  final String lastMessage;

  Message({
    required this.title,
    required this.message,
    required this.icon,
    required this.lastMessage
  });
}

class MessageChannel extends StatelessWidget {
  MessageChannel({Key? key}) : super(key: key);

  List<Message> messages = [];

  Future<void> getData() async {
    var url = Uri.parse(dotenv.env['API_KEY']!+'messages');
    try{
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      for(var json in jsonData){
        messages.add(Message(
          title: json['title'],
          message: json['message'],
          icon: json['icon'],
          lastMessage: json['last_message']
        ));
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Container(
                      height:150,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text("No Messages",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                          )),
                    )
                );
              },
            );
          }else{
            return Container(
              child: Center(
                  child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                      backgroundColor: Colors.black26,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )),
            );
          }

        }
    );
  }
}