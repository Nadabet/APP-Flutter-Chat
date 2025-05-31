Chat App 

Une application de chat moderne  développée avec Flutter utilisant le pattern BLoC pour la gestion d'état.

## 🎯 Fonctionnalités

### ✅ Implémentées
- **🇲🇦 Design Marocain** avec couleurs nationales (vert et rouge)
- **📝 Noms Marocains Authentiques** (Aicha, Youssef, Fatima Zahra, Omar, etc.)
- **🔤 Support de l'Arabe** dans l'interface et les messages
- **🎨 Interface Moderne** avec gradients, ombres et animations
- **💬 Liste des conversations** avec avatars stylisés et badges non lus
- **📱 Vue détaillée des conversations** avec bulles de messages élégantes
- **⚡ Envoi de messages** avec statuts visuels (envoi, envoyé, livré, lu)
- **➕ Création de nouvelles conversations** avec dialogue moderne
- **🧠 Gestion d'état avec BLoC** et états immuables avec Equatable
- **📊 Données simulées marocaines** pour démonstration
- **📱 Interface responsive** qui s'adapte aux écrans
- **🧪 Tests unitaires** et d'intégration complets

### 🔄 Architecture

L'application suit le pattern **BLoC (Business Logic Component)** pour une séparation claire des responsabilités :

```
lib/
├── bloc/                 # Gestion d'état BLoC
│   ├── conversation_bloc.dart
│   ├── conversation_event.dart
│   └── conversation_state.dart
├── data/                 # Données simulées
│   └── mock_data.dart
├── models/              # Modèles de données
│   ├── conversation.dart
│   └── message.dart
├── screens/             # Écrans de l'application
│   ├── conversations_screen.dart
│   └── chat_detail_screen.dart
├── widgets/             # Widgets réutilisables
│   ├── conversation_tile.dart
│   └── message_bubble.dart
└── main.dart           # Point d'entrée
```

## 🛠️ Technologies Utilisées

- **Flutter** - Framework UI
- **flutter_bloc** - Gestion d'état
- **equatable** - Comparaison d'objets immuables
- **intl** - Internationalisation et formatage des dates

## 📋 Modèles de Données

### Conversation
```dart
class Conversation {
  final String id;
  final String contactName;
  final String lastMessage;
  final DateTime timestamp;
  final int unreadCount;
  final String? avatarUrl;
}
```

### Message
```dart
class Message {
  final String id;
  final String conversationId;
  final String content;
  final bool isMe;
  final DateTime timestamp;
  final MessageStatus status;
}
```


## 🔮 Améliorations Futures

- [ ] Authentification utilisateur
- [ ] Synchronisation en temps réel avec WebSocket
- [ ] Pièces jointes (images, fichiers)
- [ ] Appels vocaux et vidéo
- [ ] Notifications push
- [ ] Recherche dans les conversations
- [ ] Thèmes sombre/clair
- [ ] Sauvegarde locale avec SQLite
- [ ] Chiffrement des messages

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :
1. Fork le projet
2. Créer une branche pour votre fonctionnalité
3. Commiter vos changements
4. Pousser vers la branche
5. Ouvrir une Pull Request

