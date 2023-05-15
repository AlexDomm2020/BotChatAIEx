import 'package:chat_gpt_app/chat/presentation/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_message_widget.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();
  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Bot Example")),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 50,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            TextFieldWidget(controller: _textEditingController),
          ],
        ),
      ),
    );
  }
}
