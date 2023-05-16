import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

import '../models/message_model.dart';

abstract class OpenAIRepository {
  Future<MessageModel?> sendRequest(CompleteText request);
}