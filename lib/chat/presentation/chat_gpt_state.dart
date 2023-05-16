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

class ChatGptGetUpdatedList extends ChatGptState {
  ChatGptGetUpdatedList(this.updatedList, {this.isTyping = false});
  final List<MessageModel?> updatedList;
  final bool isTyping;

  @override
  // TODO: implement props
  List<Object?> get props => [updatedList, isTyping];
}

