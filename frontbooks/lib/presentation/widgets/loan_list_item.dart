import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/loan_details_screen.dart';

class LoanListItem extends StatelessWidget {
  final String studentName;
  final String bookName;
  final String loanDate;
  final String returnDate;

  const LoanListItem({
    Key? key, // Agrega el parámetro de key
    required this.studentName,
    required this.bookName,
    required this.loanDate,
    required this.returnDate,
  }) : super(key: key); // Llama al constructor super y pasa la key

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoanDetailsScreen(
                studentName: studentName,
                bookName: bookName,
                loanDate: loanDate,
                returnDate: returnDate,
              ),
            ),
          );
        },
        child: ListTile(
          title: Text(
            studentName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Libro: $bookName'),
              const SizedBox(
                height: 6.0,
              ),
              Text('Fecha Préstamo: ${loanDate.toString()}'),
              const SizedBox(
                height: 6.0,
              ),
              Text('Fecha Devolucion: ${returnDate.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}
