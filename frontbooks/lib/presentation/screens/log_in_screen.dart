import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/author_Screen.dart';
import 'package:frontbooks/presentation/screens/book_Screen.dart';
import 'package:frontbooks/presentation/screens/loan_screen.dart';
import 'package:frontbooks/utils/colors.dart';
import 'package:frontbooks/utils/validators.dart';
//import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double imageSize = screenSize.width > screenSize.height
        ? screenSize.height * 0.5
        : screenSize.width * 0.7;
    final double headingFontSize = screenSize.width > 600 ? 36 : 32;
    final double inputFontSize = screenSize.width > 600 ? 16 : 12;
    final double buttonFontSize = screenSize.width > 600 ? 18 : 14;
    final double horizontalPadding = screenSize.width > 600 ? 400 : 16;
    final double verticalPadding = screenSize.width > 600 ? 32 : 8;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/background/book_logo.png",
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    Center(
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontSize: headingFontSize,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    const Text(
                      'CORREO ELECTRÓNICO',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!isValidEmail(_emailController.text)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF111A35),
                          ),
                        ),
                      ),
                      style: TextStyle(fontSize: inputFontSize),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'CONTRASEÑA',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        }
                        return null;
                      },
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF111A35),
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      style: TextStyle(fontSize: inputFontSize),
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColors.whiteColor,
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: SizedBox(
                        height: 52,
                        child: Center(
                          child: Text(
                            'INGRESAR',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: buttonFontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
