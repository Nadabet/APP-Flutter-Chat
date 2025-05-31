import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/conversation.dart';

class ConversationTile extends StatelessWidget {
  final Conversation conversation;
  final VoidCallback onTap;

  const ConversationTile({
    super.key,
    required this.conversation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: conversation.unreadCount > 0
            ? Border.all(
                color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3),
                width: 1,
              )
            : null,
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [
                Color(0xFF833AB4), // Violet Instagram
                Color(0xFFE1306C), // Rose Instagram
                Color(0xFFFD1D1D), // Rouge Instagram
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 28,
            child: conversation.avatarUrl != null
                ? ClipOval(
                    child: Image.network(
                      conversation.avatarUrl!,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildDefaultAvatar();
                      },
                    ),
                  )
                : _buildDefaultAvatar(),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                conversation.contactName,
                style: TextStyle(
                  fontWeight: conversation.unreadCount > 0
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              _formatTimestamp(conversation.timestamp),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: conversation.unreadCount > 0
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                conversation.lastMessage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: conversation.unreadCount > 0
                      ? Colors.black87
                      : Colors.grey[600],
                  fontWeight: conversation.unreadCount > 0
                      ? FontWeight.w500
                      : FontWeight.normal,
                ),
              ),
            ),
            if (conversation.unreadCount > 0)
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.secondary.withValues(alpha: 0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  conversation.unreadCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Text(
      conversation.contactName.isNotEmpty 
          ? conversation.contactName[0].toUpperCase()
          : '?',
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays == 0) {
      // Aujourd'hui - afficher l'heure
      return DateFormat('HH:mm').format(timestamp);
    } else if (difference.inDays == 1) {
      // Hier
      return 'Hier';
    } else if (difference.inDays < 7) {
      // Cette semaine - afficher le jour
      try {
        return DateFormat('EEEE', 'fr_FR').format(timestamp);
      } catch (e) {
        // Fallback si la locale française n'est pas disponible
        return DateFormat('EEEE').format(timestamp);
      }
    } else {
      // Plus ancien - afficher la date
      return DateFormat('dd/MM/yyyy').format(timestamp);
    }
  }
}
