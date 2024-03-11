import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/book_details_screen.dart';

class LoanBookItem extends StatelessWidget {
  final String bookTitle;
  final String bookAuthor;

  const LoanBookItem({
    Key? key,
    required this.bookTitle,
    required this.bookAuthor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailsScreen(
                bookTitle: bookTitle,
                bookAuthor: bookAuthor,
              ),
            ),
          );
        },
        child: ListTile(
          title: Text(
            bookTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Author: $bookAuthor'),
        ),
      ),
    );
  }
}
