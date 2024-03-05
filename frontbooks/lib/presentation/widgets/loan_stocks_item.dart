import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/stock_details_screen.dart';
class LoanStocksItem extends StatelessWidget {
  final String quantity;
  final String bookName;
  final String standId;

  const LoanStocksItem({
    Key? key,
    required this.quantity,
    required this.bookName,
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
                bookName: bookName,
                standId: standId,
              ),
            ),
          );
        },
        child: ListTile(
          title: Text(
            'Cantidad: $quantity',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nombre Libro: $bookName'),
              SizedBox(height: 6.0),
              Text('Stand ID: $standId'),
            ],
          ),
        ),
      ),
    );
  }
}
