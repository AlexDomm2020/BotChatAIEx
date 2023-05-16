part of 'chat_gpt_cubit.dart';

@immutable
abstract class ChatGptState extends Equatable {}

class ChatGptInitial extends ChatGptState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatGptLoadingRequest extends ChatGptState {
  @override
  List<Object?> get props => [];
}

class ChatGptRequestResponse extends ChatGptState {
    ChatGptRequestResponse(this.updatedList);
  final List<MessageModel?> updatedList;

  @override
  // TODO: implement props
  List<Object?> get props => [updatedList];
}

