import 'package:flutter/material.dart';
import 'package:frontbooks/utils/colors.dart';
import 'package:frontbooks/presentation/widgets/custom_scaffold.dart';
import 'package:frontbooks/presentation/screens/view_stocks_screen.dart'; // Importa la pantalla ViewStocksScreen

class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _quantityController = TextEditingController();
  String _selectedBook = 'Hábitos atómicos';
  String _selectedStand = '1';

  final List<String> _books = [
    'El sutil arte de que te importe un carajo',
    'Hábitos atómicos',
    'Make time',
  ];

  final List<String> _stands =
      List.generate(10, (index) => (index + 1).toString());

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isDesktop = screenSize.width > 600;

    final double contentWidth =
        isDesktop ? screenSize.width * 0.6 : screenSize.width;

    final double buttonFontSize = isDesktop ? 18 : 14;
    final double horizontalPadding = isDesktop ? contentWidth * 0.35 : 16;

    return CustomScaffold(
      title: 'Nuevo Stock',
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Cantidad',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce una cantidad';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Nombre Libro',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
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
                'Stand ID',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              DropdownButtonFormField<String>(
                value: _selectedStand,
                onChanged: (value) {
                  setState(() {
                    _selectedStand = value!;
                  });
                },
                items: _stands.map((stand) {
                  return DropdownMenuItem<String>(
                    value: stand,
                    child: Text('Stand $stand'),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecciona un Stand ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes manejar la lógica para guardar el stock
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
                          'REGISTRAR STOCK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: buttonFontSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewStocksScreen(), // Abrir ViewStocksScreen
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
                          'VER STOCK',
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
            ],
          ),
        ),
      ),
    );
  }
}
