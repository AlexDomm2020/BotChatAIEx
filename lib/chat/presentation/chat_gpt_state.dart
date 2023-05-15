part of 'chat_gpt_cubit.dart';

@immutable
abstract class ChatGptState extends Equatable {}

class ChatGptInitial extends ChatGptState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatGptInsert extends ChatGptState {
  ChatGptInsert(this.messages);
  final List<String?> messages;
  @override
  List<Object?> get props => [messages];
}

class ChatGptLoadingRequest extends ChatGptState {
  @override
  List<Object?> get props => [];
}

class ChatGptRequestResponse extends ChatGptState {
    ChatGptRequestResponse(this.response, this.updatedList);
  final String? response;
  final List<String?> updatedList;

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}

