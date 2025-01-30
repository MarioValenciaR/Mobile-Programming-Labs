import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _imageSource = "images/question-mark.jpg"; // Initial image

  void _onLoginPressed() {
    final password = _passwordController.text;
    setState(() {
      if (password == "QWERTY123") {
        // Change to the light bulb image
        _imageSource = "images/light-bulb.jpg";
      } else {
        // Change to the stop sign image
        _imageSource = "images/stop-sign.jpg";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        backgroundColor: Colors.purple.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text field for login
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(
                labelText: 'Login',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0), // Spacing
            // Text field for password
            TextField(
              controller: _passwordController,
              obscureText: true, // Hide text
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0), // Spacing
            // Button to log in
            ElevatedButton(
              onPressed: _onLoginPressed,
              child: const Text('Login'),
            ),
            const SizedBox(height: 20.0), // Spacing
            // Dynamically loaded image
            Image.asset(
              _imageSource,
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
