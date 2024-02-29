import 'package:flutter/material.dart';
import 'package:frontbooks/utils/colors.dart';
import 'package:frontbooks/presentation/screens/welcome_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Books',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        // Simula una carga inicial que podría tomar tiempo (p. ej. una verificación de inicio de sesión)
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          // Si el Future ha terminado (completado), muestra la pantalla de bienvenida
          if (snapshot.connectionState == ConnectionState.done) {
            return const WelcomeScreen();
          }
          // Mientras se carga el Future, muestra el splash screen
          return const SplashScreen();
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Ajustando el tamaño de la imagen según el tamaño de la pantalla
            LayoutBuilder(
              builder: (context, constraints) {
                final imageSize = constraints.maxWidth * 0.75;
                return Image.asset(
                  'assets/background/book_logo.png',
                  width: imageSize,
                );
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Bienvenido',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
            const SizedBox(height: 8), // Espacio entre los textos
            const Text(
              'Cargando...',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
