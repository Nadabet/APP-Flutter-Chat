import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../data/mock_data.dart';
import 'conversation_event.dart';
import 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  ConversationBloc() : super(const ConversationInitial()) {
    on<LoadConversations>(_onLoadConversations);
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
    on<ReceiveMessage>(_onReceiveMessage);
    on<MarkMessagesAsRead>(_onMarkMessagesAsRead);
    on<CreateNewConversation>(_onCreateNewConversation);
  }

  Future<void> _onLoadConversations(
    LoadConversations event,
    Emitter<ConversationState> emit,
  ) async {
    emit(const ConversationLoading());
    
    try {
      // Simuler un délai de chargement
      await Future.delayed(const Duration(milliseconds: 500));
      
      final conversations = List<Conversation>.from(MockData.mockConversations);
      final messages = Map<String, List<Message>>.from(MockData.mockMessages);
      
      emit(ConversationLoaded(
        conversations: conversations,
        messages: messages,
      ));
    } catch (e) {
      emit(ConversationError('Erreur lors du chargement des conversations: $e'));
    }
  }

  Future<void> _onLoadMessages(
    LoadMessages event,
    Emitter<ConversationState> emit,
  ) async {
    if (state is ConversationLoaded) {
      final currentState = state as ConversationLoaded;
      
      emit(currentState.copyWith(
        selectedConversationId: event.conversationId,
      ));
    }
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<ConversationState> emit,
  ) async {
    if (state is ConversationLoaded) {
      final currentState = state as ConversationLoaded;
      
      // Créer le nouveau message
      final newMessage = Message(
        id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
        conversationId: event.conversationId,
        content: event.content,
        isMe: true,
        timestamp: DateTime.now(),
        status: MessageStatus.sending,
      );

      // Ajouter le message à la liste existante
      final updatedMessages = Map<String, List<Message>>.from(currentState.messages);
      final conversationMessages = List<Message>.from(
        updatedMessages[event.conversationId] ?? []
      );
      conversationMessages.add(newMessage);
      updatedMessages[event.conversationId] = conversationMessages;

      // Mettre à jour la conversation avec le dernier message
      final updatedConversations = currentState.conversations.map((conv) {
        if (conv.id == event.conversationId) {
          return conv.copyWith(
            lastMessage: event.content,
            timestamp: DateTime.now(),
          );
        }
        return conv;
      }).toList();

      emit(currentState.copyWith(
        conversations: updatedConversations,
        messages: updatedMessages,
      ));

      // Simuler l'envoi du message
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Marquer le message comme envoyé
      final sentMessage = newMessage.copyWith(status: MessageStatus.sent);
      conversationMessages[conversationMessages.length - 1] = sentMessage;
      updatedMessages[event.conversationId] = conversationMessages;

      emit(currentState.copyWith(
        conversations: updatedConversations,
        messages: updatedMessages,
      ));
    }
  }

  Future<void> _onReceiveMessage(
    ReceiveMessage event,
    Emitter<ConversationState> emit,
  ) async {
    if (state is ConversationLoaded) {
      final currentState = state as ConversationLoaded;
      
      // Ajouter le message reçu
      final updatedMessages = Map<String, List<Message>>.from(currentState.messages);
      final conversationMessages = List<Message>.from(
        updatedMessages[event.message.conversationId] ?? []
      );
      conversationMessages.add(event.message);
      updatedMessages[event.message.conversationId] = conversationMessages;

      // Mettre à jour la conversation
      final updatedConversations = currentState.conversations.map((conv) {
        if (conv.id == event.message.conversationId) {
          return conv.copyWith(
            lastMessage: event.message.content,
            timestamp: event.message.timestamp,
            unreadCount: conv.unreadCount + 1,
          );
        }
        return conv;
      }).toList();

      emit(currentState.copyWith(
        conversations: updatedConversations,
        messages: updatedMessages,
      ));
    }
  }

  Future<void> _onMarkMessagesAsRead(
    MarkMessagesAsRead event,
    Emitter<ConversationState> emit,
  ) async {
    if (state is ConversationLoaded) {
      final currentState = state as ConversationLoaded;
      
      // Marquer la conversation comme lue
      final updatedConversations = currentState.conversations.map((conv) {
        if (conv.id == event.conversationId) {
          return conv.copyWith(unreadCount: 0);
        }
        return conv;
      }).toList();

      emit(currentState.copyWith(
        conversations: updatedConversations,
      ));
    }
  }

  Future<void> _onCreateNewConversation(
    CreateNewConversation event,
    Emitter<ConversationState> emit,
  ) async {
    if (state is ConversationLoaded) {
      final currentState = state as ConversationLoaded;
      
      final newConversationId = 'conv_${DateTime.now().millisecondsSinceEpoch}';
      
      // Créer la nouvelle conversation
      final newConversation = Conversation(
        id: newConversationId,
        contactName: event.contactName,
        lastMessage: event.initialMessage,
        timestamp: DateTime.now(),
        unreadCount: 0,
      );

      // Créer le message initial
      final initialMessage = Message(
        id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
        conversationId: newConversationId,
        content: event.initialMessage,
        isMe: true,
        timestamp: DateTime.now(),
        status: MessageStatus.sent,
      );

      // Mettre à jour les listes
      final updatedConversations = [newConversation, ...currentState.conversations];
      final updatedMessages = Map<String, List<Message>>.from(currentState.messages);
      updatedMessages[newConversationId] = [initialMessage];

      emit(currentState.copyWith(
        conversations: updatedConversations,
        messages: updatedMessages,
        selectedConversationId: newConversationId,
      ));
    }
  }
}
