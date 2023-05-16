import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.text, required this.sender})
      : super(key: key);

  final String? text;
  final String? sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: sender == "user prueba" ? Colors.lightGreenAccent : Colors.green[200]

            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(sender ?? "No text found",),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text ?? "No text found", textAlign: TextAlign.start,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
