import 'package:flutter/material.dart';
import 'package:frontbooks/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:frontbooks/presentation/widgets/custom_scaffold.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  String _selectedStudent = 'Ismael Cedillo';
  String _selectedBook = 'Habitos atómicos';

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
    final double buttonFontSize = screenSize.width > 600 ? 18 : 14;
    final double horizontalPadding = screenSize.width > 600 ? 400 : 16;
    //final double verticalPadding = screenSize.width > 600 ? 32 : 8;

    return CustomScaffold(
      title: 'Nuevo Préstamo',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estudiante',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: inputFontSize,
                ),
              ),
              DropdownButtonFormField<String>(
                value: _selectedStudent,
                onChanged: (value) {
                  setState(() {
                    _selectedStudent = value!;
                  });
                },
                items: _students.map((student) {
                  return DropdownMenuItem<String>(
                    value: student,
                    child: Text(student),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecciona un estudiante';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Libro',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<String>(
                value: _selectedBook,
                onChanged: (value) {
                  setState(() {
                    _selectedBook = value!;
                  });
                },
                items: _books.map((book) {
                  return DropdownMenuItem<String>(
                    value: book,
                    child: Text(book),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecciona un libro';
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const LoanScreen(),
                  //   ),
                  // );
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
            ],
          ),
        ),
      ),
    );
  }
}
