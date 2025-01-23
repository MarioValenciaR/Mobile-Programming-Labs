import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2 Login Page',
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

  String _imageSource = "images/question-mark.jpg"; // Imagen inicial

  void _onLoginPressed() {
    final password = _passwordController.text;
    setState(() {
      if (password == "QWERTY123") {
        // Cambiar a la imagen de la bombilla
        _imageSource = "images/light-bulb.jpg";
      } else {
        // Cambiar a la imagen de la señal de alto
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
            // Campo de texto para el login
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(
                labelText: 'Login',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0), // Espaciado
            // Campo de texto para la contraseña
            TextField(
              controller: _passwordController,
              obscureText: true, // Ocultar texto
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0), // Espaciado
            // Botón para iniciar sesión
            ElevatedButton(
              onPressed: _onLoginPressed,
              child: const Text('Login'),
            ),
            const SizedBox(height: 20.0), // Espaciado
            // Imagen dinámica cargada localmente
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
