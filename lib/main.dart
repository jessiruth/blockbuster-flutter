import 'package:flutter/material.dart';
import 'package:blockbuster/menu.dart';

void main() {
  runApp(const BlockbusterApp());
}

class BlockbusterApp extends StatelessWidget {
  const BlockbusterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blockbuster',
      theme: ThemeData(
        primaryColor: const Color(0xFFF2BED1),
        scaffoldBackgroundColor: const Color(0xFFF8E8EE),
        useMaterial3: true,
      ),
      home: Menu(),
    );
  }
}
