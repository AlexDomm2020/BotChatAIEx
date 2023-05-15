import 'package:chat_gpt_app/chat/presentation/chat_gpt_cubit.dart';
import 'package:chat_gpt_app/chat/presentation/chat_gpt_cubit.dart';
import 'package:chat_gpt_app/chat/presentation/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocBuilder<ChatGptCubit, ChatGptState>(
              builder: (context, state) {
                if (state is ChatGptInitial) {
                  return Flexible(
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
                  );
                }
                if (state is ChatGptInsert) {
                  return Flexible(
                    child: ListView.builder(
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: 50,
                          child: Text(state.messages[index]!),
                        ),
                      ),
                    ),
                  );
                }
                if (state is ChatGptLoadingRequest) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ChatGptRequestResponse) {
                  return Flexible(
                    child: ListView.builder(
                      itemCount: state.updatedList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: 50,
                          child: Text(state.updatedList[index]!),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            TextFieldWidget(controller: _textEditingController),
          ],
        ),
      ),
    );
  }
}
