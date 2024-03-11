import 'package:flutter/material.dart';
import 'package:frontbooks/utils/colors.dart';

class StockDetailsScreen extends StatefulWidget {
  final String quantity;
  final String bookName;
  final String standId;

  const StockDetailsScreen({
    Key? key,
    required this.quantity,
    required this.bookName,
    required this.standId,
  }) : super(key: key);

  @override
  State<StockDetailsScreen> createState() => _StockDetailsScreenState();
}

class _StockDetailsScreenState extends State<StockDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _quantityController;
  late TextEditingController _bookNameController;
  late TextEditingController _standIdController;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(text: widget.quantity);
    _bookNameController = TextEditingController(text: widget.bookName);
    _standIdController = TextEditingController(text: widget.standId);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isDesktop = screenSize.width > 600;

    final double contentWidth =
        isDesktop ? screenSize.width * 0.6 : screenSize.width;

    final double buttonFontSize = isDesktop ? 18 : 14;
    final double horizontalPadding = isDesktop ? contentWidth * 0.35 : 16;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Stock'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(
                  labelText: 'Cantidad',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la cantidad';
                  }
                  int? number = int.tryParse(value);
                  if (number == null || number <= 1) {
                    return 'El número debe ser un número positivo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bookNameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del Libro',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el nombre del libro';
                  }
                  RegExp specialChars = RegExp(r'[<>!@#%^&*(),.?":{}|<>]');
                  if (specialChars.hasMatch(value)) {
                    return 'Nombre del Libro No Válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _standIdController,
                initialValue: widget.standId,
                decoration: const InputDecoration(
                  labelText: 'ID del Stand',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el ID del stand';
                  }
                  RegExp specialChars = RegExp(r'[<>!@#%^&*(),.?":{}|<>]');
                  if (specialChars.hasMatch(value)) {
                    return 'ID del Stand No Válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Lógica para editar el libro
                        String quantity = _quantityController.text;
                        String bookName = _bookNameController.text;
                        String standId = _standIdController.text;
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
                          'ACTUALIZAR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: buttonFontSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implementar la lógica para eliminar el stock
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.whiteColor,
                      backgroundColor: AppColors.redColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: SizedBox(
                      height: 52,
                      child: Center(
                        child: Text(
                          'ELIMINAR',
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
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _bookNameController.dispose();
    _standIdController.dispose();
    super.dispose();
  }
}
