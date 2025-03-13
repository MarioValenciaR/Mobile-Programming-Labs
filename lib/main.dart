import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'ProfilePage.dart';
import 'ShoppingListPage.dart'; // Import ShoppingListPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 5 App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      initialRoute: '/shopping_list', // Start with ShoppingListPage
      routes: {
        '/': (context) => const LoginPage(),
        '/profile': (context) => const ProfilePage(),
        '/shopping_list': (context) => const ShoppingListPage(), // Added new route
      },
    );
  }
}
