import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/book_screen.dart';
import 'package:frontbooks/presentation/screens/loan_screen.dart';
import 'package:frontbooks/presentation/screens/stock_screen.dart';
import 'package:frontbooks/presentation/screens/view_loans_screen.dart';
import 'package:frontbooks/utils/colors.dart';

class NavOptions extends StatelessWidget {
  //NAVBAR
  const NavOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        (kIsWeb
            ? Image.network('assets/background/book_logo.png',
                fit: BoxFit.contain, height: 32)
            : Image.asset('assets/background/book_logo.png',
                fit: BoxFit.contain, height: 32)),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BookScreen(),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          child: const Row(
            children: [
              Icon(Icons.library_books,
                  color: AppColors
                      .whiteColor), // Cambia el color del icono según tu preferencia
              SizedBox(width: 10),
              Text(
                "Libros",
                style: TextStyle(color: AppColors.whiteColor),
              ), // Cambia el color del texto según tu preferencia
            ],
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoanScreen(),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          child: const Row(
            children: [
              Icon(Icons.account_balance,
                  color: AppColors
                      .whiteColor), // Cambia el color del icono según tu preferencia
              SizedBox(width: 10),
              Text(
                "Préstamos",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.whiteColor),
              ), // Cambia el color del texto según tu preferencia
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StockScreen(),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          child: const Row(
            children: [
              Icon(Icons.inventory,
                  color: AppColors
                      .whiteColor), // Cambia el color del icono según tu preferencia
              SizedBox(width: 10),
              Text(
                "Stock",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.whiteColor),
              ), // Cambia el color del texto según tu preferencia
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ViewLoansScreen(),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          child: const Row(
            children: [
              Icon(Icons.history,
                  color: AppColors
                      .whiteColor), // Cambia el color del icono según tu preferencia
              SizedBox(width: 10),
              Text(
                "Historial",
                style: TextStyle(color: AppColors.whiteColor),
              ), // Cambia el color del texto según tu preferencia
            ],
          ),
        ),
      ],
    );
  }
}
