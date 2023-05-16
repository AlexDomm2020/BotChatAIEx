import 'package:bloc/bloc.dart';
import 'package:chat_gpt_app/chat/domain/message_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

part 'chat_gpt_state.dart';

class ChatGptCubit extends Cubit<ChatGptState> {
  ChatGptCubit(this.openAI) : super(ChatGptInitial());

  final OpenAI openAI;
  final List<MessageModel?> _messages = [];

  Future sendMessage(String message) async {
    _messages.insert(0, MessageModel("user", message));
    emit(ChatGptRequestResponse(_messages));
    final request = CompleteText(prompt: message, maxTokens: 200, model: kTextDavinci3);
    emit(ChatGptLoadingRequest());
    try{
      final response = await openAI.onCompletion(request: request);
      _messages.insert(0, MessageModel("chatGpt", response!.choices[0].text.trim()));
      emit(ChatGptRequestResponse(_messages));
    }catch(e){
      rethrow;
    }
  }
}
