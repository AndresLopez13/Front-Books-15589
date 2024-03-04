import 'package:flutter/material.dart';
import 'package:frontbooks/utils/colors.dart';

class BookDetailsScreen extends StatelessWidget {
  final String bookTitle;
  final String bookAuthor;

  const BookDetailsScreen({
    Key? key,
    required this.bookTitle,
    required this.bookAuthor,
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
        title: Text('Detalles del Libro'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            TextFormField(
              initialValue: bookTitle,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Título del Libro',
              ),
            ),
            TextFormField(
              initialValue: bookAuthor,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Autor del Libro',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para editar el libro
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
                        'EDITAR',
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
                    // Lógica para eliminar el libro
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
