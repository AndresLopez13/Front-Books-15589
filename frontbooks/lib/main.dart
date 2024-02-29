import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/log_in_screen.dart';
import 'package:frontbooks/utils/colors.dart';

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
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          // Si el Future ha terminado (completado), muestra la pantalla de bienvenida
          if (snapshot.connectionState == ConnectionState.done) {
            return const LogInScreen();
          }
          // Mientras se carga el Future, muestra el splash screen
          return const SplashScreen();
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double imageSize = screenSize.width > screenSize.height
        ? screenSize.height * 0.4
        : screenSize.width * 0.7;
    final double headingFontSize = screenSize.width > 600 ? 48 : 32;
    final double loadingFontSize = screenSize.width > 600 ? 16 : 12;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Ajustando el tamaño de la imagen según el tamaño de la pantalla
            Image.asset(
              'assets/background/book_logo.png',
              width: imageSize,
            ),
            const SizedBox(height: 16),
            Text(
              'Bienvenido',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: headingFontSize,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Cargando...',
              style: TextStyle(
                fontSize: loadingFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
