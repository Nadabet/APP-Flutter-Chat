import 'package:equatable/equatable.dart';
import '../models/message.dart';

abstract class ConversationEvent extends Equatable {
  const ConversationEvent();

  @override
  List<Object?> get props => [];
}

class LoadConversations extends ConversationEvent {
  const LoadConversations();
}

class LoadMessages extends ConversationEvent {
  final String conversationId;

  const LoadMessages(this.conversationId);

  @override
  List<Object?> get props => [conversationId];
}

class SendMessage extends ConversationEvent {
  final String conversationId;
  final String content;

  const SendMessage({
    required this.conversationId,
    required this.content,
  });

  @override
  List<Object?> get props => [conversationId, content];
}

class ReceiveMessage extends ConversationEvent {
  final Message message;

  const ReceiveMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class MarkMessagesAsRead extends ConversationEvent {
  final String conversationId;

  const MarkMessagesAsRead(this.conversationId);

  @override
  List<Object?> get props => [conversationId];
}

class CreateNewConversation extends ConversationEvent {
  final String contactName;
  final String initialMessage;

  const CreateNewConversation({
    required this.contactName,
    required this.initialMessage,
  });

  @override
  List<Object?> get props => [contactName, initialMessage];
}
