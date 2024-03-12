import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/stock_details_screen.dart';

class LoanStocksItem extends StatelessWidget {
  final int quantity;
  final int bookId;
  final int standId;

  const LoanStocksItem({
    Key? key,
    required this.quantity,
    required this.bookId,
    required this.standId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StockDetailsScreen(
                quantity: quantity,
                bookId: bookId,
                standId: standId,
              ),
            ),
          );
        },
        child: ListTile(
          title: Text(
            'Cantidad: $quantity',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID del libro: $bookId'),
              const SizedBox(height: 6.0),
              Text('ID del Stand: $standId'),
            ],
          ),
        ),
      ),
    );
  }
}
