import 'package:flutter/material.dart';
import 'package:frontbooks/utils/colors.dart';

class LoanDetailsScreen extends StatelessWidget {
  final Map<String, String> loan;

  const LoanDetailsScreen({
    Key? key,
    required this.loan,
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
        title: const Text('Detalles del Préstamo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            TextFormField(
              initialValue: loan['studentName'],
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Estudiante',
              ),
            ),
            TextFormField(
              initialValue: loan['bookName'],
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Libro',
              ),
            ),
            TextFormField(
              initialValue: loan['loanDate'],
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Fecha Préstamo',
              ),
            ),
            TextFormField(
              initialValue: loan['returnDate'],
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Fecha Devolución',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para actualizar el préstamo
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
                    // Lógica para eliminar el préstamo
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
