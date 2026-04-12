// main.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const ShintVillageTutorialApp());
}

class ShintVillageTutorialApp extends StatelessWidget {
  const ShintVillageTutorialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shint Village - Tutorial',
      theme: ThemeData(
        // Tema inspirado en los colores del juego
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color(0xFFD4B896), // Color beige del juego
        fontFamily: 'PressStart2P', // Fuente pixel art
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 20, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}