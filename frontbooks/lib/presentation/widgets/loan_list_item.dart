import 'package:flutter/material.dart';

class LoanListItem extends StatelessWidget {
  final String studentName;
  final String bookName;
  final DateTime loanDate;
  final DateTime returnDate;

  const LoanListItem({
    required this.studentName,
    required this.bookName,
    required this.loanDate,
    required this.returnDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(studentName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book: $bookName'),
            Text('Loan Date: ${loanDate.toString()}'),
            Text('Return Date: ${returnDate.toString()}'),
          ],
        ),
      ),
    );
  }
}