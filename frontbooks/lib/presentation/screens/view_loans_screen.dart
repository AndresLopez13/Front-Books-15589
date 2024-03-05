import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/loan_details_screen.dart';
import 'package:frontbooks/presentation/widgets/custom_scaffold.dart';
import 'package:frontbooks/utils/colors.dart';
import 'package:frontbooks/presentation/widgets/loan_list_item.dart'; // Importa el archivo de tu LoanListItem

class ViewLoansScreen extends StatefulWidget {
  const ViewLoansScreen({Key? key}) : super(key: key);

  @override
  State<ViewLoansScreen> createState() => _ViewLoansScreenState();
}

class _ViewLoansScreenState extends State<ViewLoansScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  List<Map<String, String>> filteredLoans = [];

  @override
  void initState() {
    super.initState();
    filteredLoans =
        loans; // Inicializa la lista de préstamos filtrados con todos los préstamos al inicio
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isDesktop = screenSize.width > 600;

    final double contentWidth =
        isDesktop ? screenSize.width * 0.6 : screenSize.width;

    final double buttonFontSize = isDesktop ? 18 : 14;
    final double horizontalPadding = isDesktop ? contentWidth * 0.35 : 16;

    return CustomScaffold(
      title: 'Historial Préstamos',
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Buscar por nombre de estudiante',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      filteredLoans = loans
                          .where((loan) => loan['studentName']!
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
                const SizedBox(height: 15),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: filteredLoans.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                  itemBuilder: (context, index) {
                    final loan = filteredLoans[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoanDetailsScreen(loan: loan),
                          ),
                        );
                      },
                      child: LoanListItem(
                          loan: loan), // Paso el mapa loan como argumento
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Lista de préstamos de ejemplo (reemplazar con tu propia lista de préstamos)
final List<Map<String, String>> loans = [
  {
    'studentName': 'John Doe',
    'bookName': 'Flutter for Beginners',
    'loanDate': '29/02/2024',
    'returnDate': '03/03/2024'
  },
  {
    'studentName': 'Jane Smith',
    'bookName': 'Dart Programming',
    'loanDate': '29/02/2024',
    'returnDate': '04/03/2024'
  },
  {
    'studentName': 'Smith Perez',
    'bookName': 'Dart Programming',
    'loanDate': '29/02/2024',
    'returnDate': '04/03/2024'
  },
  {
    'studentName': 'John Doe',
    'bookName': 'Flutter for Beginners',
    'loanDate': '29/02/2024',
    'returnDate': '03/03/2024'
  },
  {
    'studentName': 'Jane Smith',
    'bookName': 'Dart Programming',
    'loanDate': '29/02/2024',
    'returnDate': '04/03/2024'
  },
  {
    'studentName': 'Smith Perez',
    'bookName': 'Dart Programming',
    'loanDate': '29/02/2024',
    'returnDate': '04/03/2024'
  },
  {
    'studentName': 'John Doe',
    'bookName': 'Flutter for Beginners',
    'loanDate': '29/02/2024',
    'returnDate': '03/03/2024'
  },
  {
    'studentName': 'Jane Smith',
    'bookName': 'Dart Programming',
    'loanDate': '29/02/2024',
    'returnDate': '04/03/2024'
  },
  {
    'studentName': 'Smith Perez',
    'bookName': 'Dart Programming',
    'loanDate': '29/02/2024',
    'returnDate': '04/03/2024'
  },
];
