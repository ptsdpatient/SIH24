import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gradsy/components/load.dart';

import 'package:http/http.dart' as http;
import '../token.dart';

final apiKey=dotenv.env['API_KEY']!;


Future<void> fetchChannels() async {
  String? token = await storage.read(key: 'auth_token');
  final url = Uri.parse('${apiKey}messageChannels');

  try {
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print('Message Channels received successfully');

    } else {
      print('Message Channels failed: ${response.statusCode} - ${response.body}');

    }
  } catch (error) {
    print('Error occurred: $error');
  }
}

FutureBuilder messageBuilder(){
  return FutureBuilder(
    future: fetchChannels(),
    builder: (context, snapshot){
      if(snapshot.hasData){
        return Text(snapshot.data);
      }else if(snapshot.hasError){
        return Text("An error occurred: ${snapshot.error}");
      } else{
        return LoadIcon();
      }
    }
  );
}

FutureBuilder groupBuilder(){
  return FutureBuilder(
      future: fetchChannels(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Text(snapshot.data);
        }else if(snapshot.hasError){
          return Text("An error occurred: ${snapshot.error}");
        } else{
          return LoadIcon();
        }
      }
  );
}

FutureBuilder collegeBuilder(){
  return FutureBuilder(
      future: fetchChannels(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Text(snapshot.data);
        }else if(snapshot.hasError){
          return Text("An error occurred: ${snapshot.error}");
        } else{
          return LoadIcon();
        }
      }
  );
}