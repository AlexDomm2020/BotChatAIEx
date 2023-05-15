import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

part 'chat_gpt_state.dart';

class ChatGptCubit extends Cubit<ChatGptState> {
  ChatGptCubit(this.openAI) : super(ChatGptInitial());

  final OpenAI openAI;
  final List<String?> _messages = [];

  void insertMessage(String message){
    _messages.insert(0, message);
    emit(ChatGptInsert(_messages));
  }

  Future sendMessage(String message) async {
    final request = CompleteText(prompt: message, maxTokens: 200, model: kTextDavinci3);
    emit(ChatGptLoadingRequest());
    try{
      final response = await openAI.onCompletion(request: request);
      _messages.insert(0, response?.choices[0].text);
      emit(ChatGptRequestResponse(response?.choices[0].text, _messages));
    }catch(e){
      rethrow;
    }
  }
}
