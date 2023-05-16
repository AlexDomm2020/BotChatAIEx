import 'package:chat_gpt_app/chat/domain/models/message_model.dart';
import 'package:chat_gpt_app/chat/domain/repositories/openai_repository.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class OpenAIRepositoryImpl extends OpenAIRepository {
  OpenAIRepositoryImpl(this.openAI);
  final OpenAI openAI;
  @override
  Future<MessageModel?> sendRequest(CompleteText request) async {
    try{
      final response = await openAI.onCompletion(request: request);
      return MessageModel('ChatBot', response?.choices[0].text.trim());
    }catch(e){
      rethrow;
    }
  }

}