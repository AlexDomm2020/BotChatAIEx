import 'package:chat_gpt_app/chat/presentation/chat_gpt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatGptCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: (value) async {
                cubit.insertMessage(controller.text);
                FocusManager.instance.primaryFocus?.unfocus();
                await cubit.sendMessage(controller.text, controller);
              },
              controller: controller,
              decoration:
                  const InputDecoration.collapsed(hintText: "Ask something..."),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () async {
              cubit.insertMessage(controller.text);
              FocusManager.instance.primaryFocus?.unfocus();
              await cubit.sendMessage(controller.text, controller);
            },
          ),
        ],
      ),
    );
  }
}
