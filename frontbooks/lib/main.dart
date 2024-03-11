import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/log_in_screen.dart';
import 'package:frontbooks/presentation/screens/view_loans_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Books System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.light,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => ViewLoansScreen(),
          '/login': (context) => const LogInScreen(),
          '/home': (context) => ViewLoansScreen(),
        });
  }
}
