import 'package:flutter/material.dart';
import 'package:frontbooks/utils/colors.dart';

class LoanDetailsScreen extends StatelessWidget {
  final String studentName;
  final String bookName;
  final String loanDate;
  final String returnDate;

  const LoanDetailsScreen({
    Key? key,
    required this.studentName,
    required this.bookName,
    required this.loanDate,
    required this.returnDate,
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
              //controller: studentNameController,
              decoration: const InputDecoration(
                labelText: 'Estudiante',
              ),
            ),
            TextFormField(
              //controller: bookNameController,
              decoration: const InputDecoration(
                labelText: 'Libro',
              ),
            ),
            TextFormField(
              //controller: loanDateController,
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  //loanDateController.text = pickedDate.toString();
                }
              },
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Fecha Préstamo',
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            TextFormField(
              //controller: returnDateController,
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  //returnDateController.text = pickedDate.toString();
                }
              },
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Fecha Devolución',
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const LoanScreen(),
                    //   ),
                    // );
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
