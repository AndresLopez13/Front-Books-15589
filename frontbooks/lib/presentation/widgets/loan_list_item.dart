import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/loan_details_screen.dart';

class LoanListItem extends StatelessWidget {
  final Map<String, String> loan;

  const LoanListItem({
    Key? key,
    required this.loan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String studentId = loan['studentId']!; // Cambio aquí
    final String bookId = loan['bookId']!; // Cambio aquí
    final String loanDate = loan['loanDate']!;
    final String returnDate = loan['returnDate']!;

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoanDetailsScreen(loan: loan),
            ),
          );
        },
        child: ListTile(
          title: Text(
            'ID Estudiante: $studentId', // Cambio aquí
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID Libro: $bookId'), // Cambio aquí
              const SizedBox(
                height: 6.0,
              ),
              Text('Fecha Préstamo: $loanDate'),
              const SizedBox(
                height: 6.0,
              ),
              Text('Fecha Devolución: $returnDate'),
            ],
          ),
        ),
      ),
    );
  }
}
