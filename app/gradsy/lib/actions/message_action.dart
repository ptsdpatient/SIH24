import 'package:flutter/material.dart';

class MessageCreatePrompt extends StatefulWidget{
  @override
  _MessageCreatePromptState createState() => _MessageCreatePromptState();
}

class _MessageCreatePromptState extends State<MessageCreatePrompt> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Message'),
      ),
    );
  }
}
