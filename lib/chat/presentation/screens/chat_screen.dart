import 'package:chat_gpt_app/chat/domain/models/message_model.dart';
import 'package:chat_gpt_app/chat/presentation/chat_gpt_cubit.dart';
import 'package:chat_gpt_app/chat/presentation/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/chat_message_widget.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AIeX Assistant",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<ChatGptCubit, ChatGptState>(
          builder: (context, state) {
            if (state is ChatGptInitial) {
              return Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: 0,
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
              );
            }
            if (state is ChatGptGetUpdatedList) {
              return Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: state.updatedList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ChatMessage(
                          text: state.updatedList[index]!.message,
                          sender: state.updatedList[index]!.sender,
                        ),
                      ),
                    ),
                  ),
                  state.isTyping
                      ? const CircularProgressIndicator()
                      : const SizedBox.shrink(),
                  TextFieldWidget(controller: _textEditingController),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
