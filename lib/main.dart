import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'bloc/conversation_bloc.dart';
import 'screens/conversations_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialiser les données de localisation pour le français
  await initializeDateFormatting('fr_FR', null);

  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConversationBloc(),
      child: MaterialApp(
        title: 'Chat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: const Color(0xFF833AB4), // Violet Instagram
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF833AB4),
            brightness: Brightness.light,
            primary: const Color(0xFF833AB4),
            secondary: const Color(0xFFE1306C), // Rose Instagram
            surface: const Color(0xFFF5F5F5),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF833AB4), // Sera remplacé par le gradient
            foregroundColor: Colors.white,
            elevation: 2,
            shadowColor: Colors.black26,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xFFE1306C), // Rose Instagram
            foregroundColor: Colors.white,
            elevation: 6,
          ),
          cardTheme: CardThemeData(
            elevation: 2,
            shadowColor: Colors.black12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          useMaterial3: true,
        ),
        home: const ConversationsScreen(),
      ),
    );
  }
}
