import '../models/conversation.dart';
import '../models/message.dart';

class MockData {
  static final List<Conversation> mockConversations = [
    Conversation(
      id: '1',
      contactName: 'Aicha Benali',
      lastMessage: 'Salut ! Comment ça va ?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      unreadCount: 2,
      avatarUrl: null,
    ),
    Conversation(
      id: '2',
      contactName: 'Youssef El Amrani',
      lastMessage: 'On se voit demain ?',
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      unreadCount: 0,
      avatarUrl: null,
    ),
    Conversation(
      id: '3',
      contactName: 'Fatima Zahra',
      lastMessage: 'Merci pour ton aide !',
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      unreadCount: 1,
      avatarUrl: null,
    ),
    Conversation(
      id: '4',
      contactName: 'Omar Tazi',
      lastMessage: 'À bientôt mon frère 👋',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      unreadCount: 0,
      avatarUrl: null,
    ),
    Conversation(
      id: '5',
      contactName: 'Khadija Alaoui',
      lastMessage: 'Super idée ! 💡',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      unreadCount: 3,
      avatarUrl: null,
    ),
    Conversation(
      id: '6',
      contactName: 'Hassan Benjelloun',
      lastMessage: 'Merci pour tout !',
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
      unreadCount: 0,
      avatarUrl: null,
    ),
    Conversation(
      id: '7',
      contactName: 'Zineb Chraibi',
      lastMessage: 'On se voit au bureau demain',
      timestamp: DateTime.now().subtract(const Duration(days: 4)),
      unreadCount: 1,
      avatarUrl: null,
    ),
  ];

  static final Map<String, List<Message>> mockMessages = {
    '1': [
      Message(
        id: 'm1',
        conversationId: '1',
        content: 'Salut Aicha ! Ça va très bien merci 😊',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
        status: MessageStatus.read,
      ),
      Message(
        id: 'm2',
        conversationId: '1',
        content: 'Et toi, comment ça se passe ?',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 9)),
        status: MessageStatus.read,
      ),
      Message(
        id: 'm3',
        conversationId: '1',
        content: 'Ça va super bien ! Je viens de finir mon projet',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 7)),
        status: MessageStatus.delivered,
      ),
      Message(
        id: 'm4',
        conversationId: '1',
        content: 'Salut ! Comment ça va ?',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        status: MessageStatus.delivered,
      ),
    ],
    '2': [
      Message(
        id: 'm5',
        conversationId: '2',
        content: 'Salut Youssef !',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        status: MessageStatus.read,
      ),
      Message(
        id: 'm6',
        conversationId: '2',
        content: 'On se voit demain ?',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        status: MessageStatus.delivered,
      ),
      Message(
        id: 'm7',
        conversationId: '2',
        content: 'Oui parfait ! À quelle heure ?',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 50)),
        status: MessageStatus.sent,
      ),
    ],
    '3': [
      Message(
        id: 'm8',
        conversationId: '3',
        content: 'De rien Fatima ! 😊',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(hours: 4)),
        status: MessageStatus.read,
      ),
      Message(
        id: 'm9',
        conversationId: '3',
        content: 'Merci pour ton aide !',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        status: MessageStatus.delivered,
      ),
    ],
    '4': [
      Message(
        id: 'm10',
        conversationId: '4',
        content: 'À bientôt Omar ! 👋',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        status: MessageStatus.read,
      ),
      Message(
        id: 'm11',
        conversationId: '4',
        content: 'À bientôt mon frère 👋',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        status: MessageStatus.delivered,
      ),
    ],
    '5': [
      Message(
        id: 'm12',
        conversationId: '5',
        content: 'J\'ai une super idée pour le projet !',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 1)),
        status: MessageStatus.read,
      ),
      Message(
        id: 'm13',
        conversationId: '5',
        content: 'Super idée ! 💡',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        status: MessageStatus.delivered,
      ),
      Message(
        id: 'm14',
        conversationId: '5',
        content: 'On peut en discuter demain ?',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        status: MessageStatus.delivered,
      ),
      Message(
        id: 'm15',
        conversationId: '5',
        content: 'Bien sûr ! 🚀',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        status: MessageStatus.delivered,
      ),
    ],
    '6': [
      Message(
        id: 'm16',
        conversationId: '6',
        content: 'De rien Hassan, quand tu veux !',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(days: 3, hours: 1)),
        status: MessageStatus.read,
      ),
      Message(
        id: 'm17',
        conversationId: '6',
        content: 'Merci pour tout !',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(days: 3)),
        status: MessageStatus.delivered,
      ),
    ],
    '7': [
      Message(
        id: 'm18',
        conversationId: '7',
        content: 'D\'accord Zineb, à demain !',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(days: 4, hours: 2)),
        status: MessageStatus.read,
      ),
      Message(
        id: 'm19',
        conversationId: '7',
        content: 'On se voit au bureau demain',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(days: 4)),
        status: MessageStatus.delivered,
      ),
    ],
  };

  static List<Message> getMessagesForConversation(String conversationId) {
    return mockMessages[conversationId] ?? [];
  }
}
