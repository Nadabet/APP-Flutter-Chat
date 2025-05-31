import 'package:equatable/equatable.dart';
import '../models/conversation.dart';
import '../models/message.dart';

abstract class ConversationState extends Equatable {
  const ConversationState();

  @override
  List<Object?> get props => [];
}

class ConversationInitial extends ConversationState {
  const ConversationInitial();
}

class ConversationLoading extends ConversationState {
  const ConversationLoading();
}

class ConversationLoaded extends ConversationState {
  final List<Conversation> conversations;
  final Map<String, List<Message>> messages;
  final String? selectedConversationId;

  const ConversationLoaded({
    required this.conversations,
    required this.messages,
    this.selectedConversationId,
  });

  @override
  List<Object?> get props => [conversations, messages, selectedConversationId];

  ConversationLoaded copyWith({
    List<Conversation>? conversations,
    Map<String, List<Message>>? messages,
    String? selectedConversationId,
  }) {
    return ConversationLoaded(
      conversations: conversations ?? this.conversations,
      messages: messages ?? this.messages,
      selectedConversationId: selectedConversationId ?? this.selectedConversationId,
    );
  }

  List<Message> getMessagesForConversation(String conversationId) {
    return messages[conversationId] ?? [];
  }

  Conversation? getConversationById(String conversationId) {
    try {
      return conversations.firstWhere((conv) => conv.id == conversationId);
    } catch (e) {
      return null;
    }
  }
}

class ConversationError extends ConversationState {
  final String message;

  const ConversationError(this.message);

  @override
  List<Object?> get props => [message];
}

class MessageSending extends ConversationState {
  final String conversationId;
  final String content;

  const MessageSending({
    required this.conversationId,
    required this.content,
  });

  @override
  List<Object?> get props => [conversationId, content];
}

class MessageSent extends ConversationState {
  final Message message;

  const MessageSent(this.message);

  @override
  List<Object?> get props => [message];
}

class MessageReceived extends ConversationState {
  final Message message;

  const MessageReceived(this.message);

  @override
  List<Object?> get props => [message];
}
