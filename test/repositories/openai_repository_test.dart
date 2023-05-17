import 'package:chat_gpt_app/chat/domain/models/message_model.dart';
import 'package:chat_gpt_app/chat/domain/repositories/openai_repository.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'openai_repository_test.mocks.dart';

@GenerateMocks([OpenAIRepository])
void main(){
  late MockOpenAIRepository repo;

  setUpAll(() {
    repo = MockOpenAIRepository();
  });

  test('When sending request to OpenAI endpoint it should return a message model.', () async {
    final request = CompleteText(prompt: 'Hello', maxTokens: 200, model: kTextDavinci3);
    final model = MessageModel('chatbot', 'Hello there');
    when(repo.sendRequest(request)).thenAnswer((_) async {
      return model;
    });
    final result = await repo.sendRequest(request);
    expect(result, model);
  });

  test('When not sending correct request it throws excception', () async {
    final request = CompleteText(prompt: '', maxTokens: 200, model: kTextDavinci3);
    when(repo.sendRequest(request)).thenAnswer((_) async {
      throw Exception();
    });

    final res = repo.sendRequest(request);
    expect(res, throwsException);
  });
}