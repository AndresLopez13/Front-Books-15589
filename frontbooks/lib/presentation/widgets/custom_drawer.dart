import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/book_screen.dart';
import 'package:frontbooks/presentation/screens/loan_screen.dart';
import 'package:frontbooks/presentation/screens/log_in_screen.dart';
import 'package:frontbooks/presentation/screens/stock_screen.dart';
import 'package:frontbooks/presentation/screens/view_loans_screen.dart';
import 'package:frontbooks/utils/colors.dart';

class CustomDrawer extends StatelessWidget {
  //SIDEBAR
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      // backgroundColor: const Color(0xffF2F8F8),
      child: OptionsDrawer(),
    );
  }
}

class OptionsDrawer extends StatelessWidget {
  const OptionsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Text(
            'Menú Principal Libros',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.library_books,
                  color: AppColors
                      .blackColor), // Cambia el color del icono según tu preferencia
              SizedBox(width: 10),
              Text("Libros",
                  style: TextStyle(
                      color: AppColors
                          .blackColor)), // Cambia el color del texto según tu preferencia
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BookScreen(),
              ),
            );
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.account_balance,
                  color: AppColors.blackColor), // Cambia el color del icono según tu preferencia
              SizedBox(width: 10),
              Text("Prestamo",
                  style: TextStyle(
                      color: AppColors.blackColor)), // Cambia el color del texto según tu preferencia
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoanScreen(),
              ),
            );
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.history,
                  color: AppColors.blackColor), // Cambia el color del icono según tu preferencia
              SizedBox(width: 10),
              Text("Stock",
                  style: TextStyle(
                      color: AppColors.blackColor)), // Cambia el color del texto según tu preferencia
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StockScreen(),
              ),
            );
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.history,
                  color: AppColors.blackColor), // Cambia el color del icono según tu preferencia
              SizedBox(width: 10),
              Text("Historial Préstamos",
                  style: TextStyle(
                      color: AppColors.blackColor)), // Cambia el color del texto según tu preferencia
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ViewLoansScreen(),
              ),
            );
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Cerrar Sesión'),
          leading: const Icon(Icons.exit_to_app),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LogInScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
