import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        mainAxisAlignment: message.isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isMe) ...[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.grey[400]!,
                    Colors.grey[300]!,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.transparent,
                child: const Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: message.isMe
                    ? const LinearGradient(
                        colors: [
                          Color(0xFF833AB4), // Violet Instagram
                          Color(0xFFE1306C), // Rose Instagram
                          Color(0xFFFD1D1D), // Rouge Instagram
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : LinearGradient(
                        colors: [
                          Colors.grey[100]!,
                          Colors.grey[50]!,
                        ],
                      ),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(24),
                  topRight: const Radius.circular(24),
                  bottomLeft: message.isMe
                      ? const Radius.circular(24)
                      : const Radius.circular(6),
                  bottomRight: message.isMe
                      ? const Radius.circular(6)
                      : const Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: message.isMe
                        ? Theme.of(context).primaryColor.withValues(alpha: 0.3)
                        : Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.content,
                    style: TextStyle(
                      color: message.isMe ? Colors.white : Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat('HH:mm').format(message.timestamp),
                        style: TextStyle(
                          color: message.isMe 
                              ? Colors.white70 
                              : Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      if (message.isMe) ...[
                        const SizedBox(width: 4),
                        _buildStatusIcon(),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (message.isMe) ...[
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withValues(alpha: 0.2),
                    Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.person,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusIcon() {
    switch (message.status) {
      case MessageStatus.sending:
        return const SizedBox(
          width: 12,
          height: 12,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
          ),
        );
      case MessageStatus.sent:
        return const Icon(
          Icons.check,
          size: 16,
          color: Colors.white70,
        );
      case MessageStatus.delivered:
        return const Icon(
          Icons.done_all,
          size: 16,
          color: Colors.white70,
        );
      case MessageStatus.read:
        return const Icon(
          Icons.done_all,
          size: 16,
          color: Colors.blue,
        );
      case MessageStatus.failed:
        return const Icon(
          Icons.error_outline,
          size: 16,
          color: Colors.red,
        );
    }
  }
}
