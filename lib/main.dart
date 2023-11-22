import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:blockbuster/screens/login.dart';

void main() {
  runApp(const BlockbusterApp());
}

class BlockbusterApp extends StatelessWidget {
  const BlockbusterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Blockbuster',
        theme: ThemeData(
          primaryColor: const Color(0xFFF2BED1),
          scaffoldBackgroundColor: const Color(0xFFF8E8EE),
          useMaterial3: true,
        ),
        home: LoginPage(),
      ),
    );
  }
}
