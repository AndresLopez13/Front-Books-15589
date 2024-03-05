import 'package:flutter/material.dart';
import 'package:frontbooks/utils/colors.dart';

class StockDetailsScreen extends StatelessWidget {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            TextFormField(
              initialValue: quantity,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Cantidad',
              ),
            ),
            TextFormField(
              initialValue: bookName,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Nombre del Libro',
              ),
            ),
            TextFormField(
              initialValue: standId,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'ID del Stand',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implementar la lógica para actualizar el stock
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
    );
  }
}
