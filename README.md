# 💬 تطبيق الدردشة المغربي - Chat App Marocain

Une application de chat moderne avec design marocain développée avec Flutter utilisant le pattern BLoC pour la gestion d'état.

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

## 🚀 Installation et Lancement

### Prérequis
- Flutter SDK (version 3.8.1 ou supérieure)
- Dart SDK
- Un navigateur web ou un émulateur mobile

### Installation
```bash
# Cloner le projet
git clone <url-du-repo>
cd app_chat

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```

### Lancement sur le web
```bash
flutter run -d chrome --web-port=8080
```

### Tests
```bash
# Lancer tous les tests
flutter test

# Lancer les tests avec couverture
flutter test --coverage
```

## 📱 Captures d'écran

### 🏠 Écran des conversations "الرسائل"
- **Design marocain** avec header en dégradé vert
- **Avatars avec gradients** et ombres élégantes
- **Cartes de conversations** avec bordures arrondies et ombres
- **Badges de messages non lus** avec dégradé rouge
- **Noms marocains authentiques** (Aicha Benali, Youssef El Amrani, etc.)
- **Messages en arabe** avec support RTL
- **Timestamps formatés** en français
- **Pull-to-refresh** avec animation

### 💬 Écran de chat détaillé
- **Header personnalisé** avec avatar et statut "متصل الآن"
- **Bulles de messages stylisées** avec gradients et ombres
- **Alignement intelligent** (droite pour moi, gauche pour les autres)
- **Statuts visuels** des messages avec icônes colorées
- **Champ de saisie moderne** avec bordures arrondies
- **Bouton d'envoi** avec dégradé rouge et animation
- **Scroll automatique** vers les nouveaux messages

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

## 🎨 Design & UI/UX Marocain

- **🇲🇦 Palette de couleurs marocaine** : Vert (#2E7D32) et Rouge (#D32F2F)
- **🎨 Gradients élégants** sur les avatars, boutons et headers
- **💫 Ombres et élévations** pour un effet de profondeur moderne
- **🔄 Animations fluides** pour les transitions et interactions
- **📱 Design responsive** qui s'adapte aux différentes tailles d'écran
- **🎯 Feedback visuel** immédiat pour toutes les interactions
- **⚡ Gestion des états** de chargement et d'erreur avec style
- **🌟 Interface moderne** avec bordures arrondies et espacement harmonieux
- **🔤 Support multilingue** (Français et Arabe) avec RTL
- **🎪 Cartes flottantes** avec ombres pour les conversations

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

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.
