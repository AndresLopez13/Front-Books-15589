import 'dart:convert';
import 'package:frontbooks/config/API/endpoints_api.dart';
import 'package:frontbooks/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';

class AuthService {
  static Future<String?> login(
      String username, String password, BuildContext context) async {
    try {
      var url = Uri.parse(Endpoints.login);
      var response = await http.post(
        url,
        body: {'username': username, 'password': password},
      );
      print("login status ${response.statusCode}");

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var token = jsonResponse['access_token'];

        // Guardar el token en SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', token);

        return token;
      } else {
        var jsonResponse = json.decode(response.body);
        final snackBar = SnackBar(content: Text(jsonResponse['detail']));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return null;
      }
    } catch (e) {
      // print('Error durante el inicio de sesión: $e');
      return null;
    }
  }
}

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (!kIsWeb || MediaQuery.of(context).size.width <= 600) {
              return VerticalLoginLayout();
            } else {
              return HorizontalLoginLayout();
            }
          },
        ),
      ),
    );
  }
}

class VerticalLoginLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              !kIsWeb
                  ? Image.asset(
                      "assets/background/book_logo.png",
                      height: MediaQuery.of(context).size.height * 0.4,
                    )
                  : Image.network(
                      "assets/background/book_logo.png",
                      width: MediaQuery.of(context).size.width *
                          (kIsWeb ? 0.2 : 0.65),
                    ),
              const SizedBox(width: kIsWeb ? 100 : 0),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalLoginLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            "assets/background/book_logo.png",
            width: MediaQuery.of(context).size.width * (kIsWeb ? 0.2 : 0.65),
          ),
          const SizedBox(width: kIsWeb ? 100 : 20),
          const SizedBox(
            height: 250,
            child: Center(child: LoginForm()),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

final http.Client client = http.Client();

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late http.Client client;

  @override
  void initState() {
    super.initState();
    client = http.Client();
  }

  @override
  void dispose() {
    client.close();
    super.dispose();
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  Future<void> _handleLogin(BuildContext context) async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String? token = await AuthService.login(username, password, context);
    if (token != null) {
      // Login exitoso, navegar a la página de inicio
      Navigator.pushReplacementNamed(context, '/home');
    }
    // else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Inicio de sesión fallido')),
    //   );
    // }
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      try {
        var url = Uri.parse(Endpoints.login);

        var request = http.MultipartRequest('POST', url);
        request.fields['username'] = username;
        request.fields['password'] = password;

        var response = await request.send();

        if (response.statusCode == 200) {
          String responseBody = await response.stream.bytesToString();
          Map<String, dynamic> jsonResponse = json.decode(responseBody);
          String token = jsonResponse['access_token'];

          _saveToken(token).then((value) {
            Navigator.pushReplacementNamed(context, '/home');
          });
        } else {
          if (kDebugMode) {
            String responseBody = await response.stream.bytesToString();
            print('Error during login: $responseBody');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error during login: $e');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isDesktop = screenSize.width > 600;
    final double buttonFontSize = isDesktop ? 18 : 14;

    return Theme(
      data: ThemeData(
        hintColor: const Color(0xFFA53F2B),
        primaryColorDark: const Color(0xFFA53F2B),
        primaryColor: const MaterialColor(0xFF305252, {
          50: Color(0xFF305252),
          100: Color(0xFF305252),
          200: Color(0xFF305252),
          300: Color(0xFF305252),
          400: Color(0xFF305252),
          500: Color(0xFF305252),
          600: Color(0xFF305252),
          700: Color(0xFF305252),
          800: Color(0xFF305252),
          900: Color(0xFF305252),
        }),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: !kIsWeb
                        ? MediaQuery.of(context).size.width * 0.75
                        : 350,
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Usuario',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa el nombre de usuario';
                        }
                        if (value.contains('@')) {
                          return 'El nombre de usuario no puede contener el símbolo "@"';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: !kIsWeb
                        ? MediaQuery.of(context).size.width * 0.75
                        : 350,
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa la contraseña';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: !kIsWeb
                        ? MediaQuery.of(context).size.width * 0.75
                        : 350,
                    child: ElevatedButton(
                      onPressed: () => _handleLogin(context),
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
                            'INICIAR SESIÓN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: buttonFontSize,
                            ),
                          ),
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
    );
  }
}
