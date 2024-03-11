import 'package:flutter/material.dart';
import 'package:frontbooks/config/API/endpoints_api.dart';
import 'package:frontbooks/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:frontbooks/presentation/widgets/custom_scaffold.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Función para enviar los datos al endpoint
Future<void> sendLoanDataToEndpoint({
  required int studentId,
  required int bookId,
  required String loanDate,
  required String returnDate,
}) async {
  // Construye el cuerpo de la solicitud en formato JSON
  final Map<String, dynamic> requestData = {
    'student_id': studentId,
    'book_id': bookId,
    'loan_date': loanDate,
    'return_date': returnDate,
  };

  // Convierte el mapa en una cadena JSON
  final String requestBody = jsonEncode(requestData);

  // Realiza la solicitud HTTP POST
  final response = await http.post(
    Uri.parse(Endpoints.lending),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: requestBody,
  );

  // Verifica el estado de la respuesta
  if (response.statusCode == 200) {
    print('Datos enviados correctamente');
  } else {
    print('Error al enviar los datos: ${response.statusCode}');
  }
}

class LoanScreen extends StatefulWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  String _studentId = '';
  String _bookId = '';

  final List<String> _students = [
    'Ismael Cedillo',
    'Andrés López',
    'Adrian Iza',
  ];

  final List<String> _books = [
    'El sutil arte de que te importe un carajo',
    'Habitos atómicos',
    'Make time',
  ];

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double inputFontSize = screenSize.width > 600 ? 16 : 12;
    final bool isDesktop = screenSize.width > 600;

    final double contentWidth =
        isDesktop ? screenSize.width * 0.6 : screenSize.width;

    final double buttonFontSize = isDesktop ? 18 : 14;
    final double horizontalPadding = isDesktop ? contentWidth * 0.35 : 16;

    return CustomScaffold(
      title: 'Nuevo Préstamo',
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                'Estudiante ID', // Cambiar texto a "Estudiante ID"
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: inputFontSize,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number, // Teclado numérico
                onChanged: (value) {
                  _studentId = value; // Capturar el valor del ID del estudiante
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el ID del estudiante';
                  }
                  RegExp numbersOnly = RegExp(r'^[0-9]+$');
                  if (!numbersOnly.hasMatch(value)) {
                    return 'Por favor, ingresa solo números';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Libro ID', // Cambiar texto a "Libro ID"
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number, // Teclado numérico
                onChanged: (value) {
                  _bookId = value; // Capturar el valor del ID del libro
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el ID del libro';
                  }
                  RegExp numbersOnly = RegExp(r'^[0-9]+$');
                  if (!numbersOnly.hasMatch(value)) {
                    return 'Por favor, ingresa solo números';
                  }
                  int? number = int.tryParse(value);
                  if (number == null || number <= 1) {
                    return 'El número debe ser positivo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Fecha Préstamo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _startDateController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      _startDateController.text =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecciona una fecha';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.calendar_today),
                  border: const OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: horizontalPadding),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Fecha Devolución',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _endDateController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      _endDateController.text =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecciona una fecha';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.calendar_today),
                  border: const OutlineInputBorder(),
                  fillColor: AppColors.primaryColor,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: horizontalPadding),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Validar el formulario antes de enviar los datos
                  if (_formKey.currentState!.validate()) {
                    // Obtener las fechas seleccionadas del formulario
                    final loanDate = _startDateController.text;
                    final returnDate = _endDateController.text;

                    // Enviar los datos al endpoint
                    sendLoanDataToEndpoint(
                      studentId: int.parse(_studentId),
                      bookId: int.parse(_bookId),
                      loanDate: loanDate,
                      returnDate: returnDate,
                    );
                  }
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
                      'REGISTRAR PRÉSTAMO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: buttonFontSize,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
