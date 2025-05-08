import 'package:flutter/material.dart';
import 'modules/home/home_screen.dart';
void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mass Chikan',
      theme: ThemeData(fontFamily: 'Helvetica', useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

  