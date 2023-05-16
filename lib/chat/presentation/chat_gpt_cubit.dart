import 'package:bloc/bloc.dart';
import 'package:chat_gpt_app/chat/data/repositories_implementations/openai_repository_impl.dart';
import 'package:chat_gpt_app/chat/domain/models/message_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

part 'chat_gpt_state.dart';

class ChatGptCubit extends Cubit<ChatGptState> {
  ChatGptCubit(this.openAIRepositoryImpl) : super(ChatGptInitial());

  final OpenAIRepositoryImpl openAIRepositoryImpl;
  final List<MessageModel?> _messages = [];

  void insertMessage(String message){
    _messages.insert(0, MessageModel("user", message));
    emit(ChatGptGetUpdatedList(_messages, isTyping: true));
  }

  Future sendMessage(String message, TextEditingController controller) async {
    controller.clear();
    final request = CompleteText(prompt: message, maxTokens: 200, model: kTextDavinci3);
    try{
      final response = await openAIRepositoryImpl.sendRequest(request);
      _messages.insert(0, response);
      emit(ChatGptGetUpdatedList(_messages, isTyping: false));
    }catch(e){
      rethrow;
    }
  }
}
