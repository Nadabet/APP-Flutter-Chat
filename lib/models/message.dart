import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String id;
  final String conversationId;
  final String content;
  final bool isMe;
  final DateTime timestamp;
  final MessageStatus status;

  const Message({
    required this.id,
    required this.conversationId,
    required this.content,
    required this.isMe,
    required this.timestamp,
    this.status = MessageStatus.sent,
  });

  @override
  List<Object?> get props => [
        id,
        conversationId,
        content,
        isMe,
        timestamp,
        status,
      ];

  Message copyWith({
    String? id,
    String? conversationId,
    String? content,
    bool? isMe,
    DateTime? timestamp,
    MessageStatus? status,
  }) {
    return Message(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      content: content ?? this.content,
      isMe: isMe ?? this.isMe,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'Message(id: $id, conversationId: $conversationId, content: $content, isMe: $isMe, timestamp: $timestamp, status: $status)';
  }
}

enum MessageStatus {
  sending,
  sent,
  delivered,
  read,
  failed,
}
