import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    //final double inputFontSize = screenSize.width > 600 ? 16 : 12;
    final double buttonFontSize = screenSize.width > 600 ? 18 : 14;
    final double horizontalPadding = screenSize.width > 600 ? 400 : 16;

    // Suponiendo que tienes una lista de préstamos, aquí la estoy simulando con datos de ejemplo
    List<Widget> loanItems = [
      LoanListItem(
        studentName: 'John Doe',
        bookName: 'Flutter for Beginners',
        loanDate: DateTime.now(),
        returnDate: DateTime.now().add(Duration(days: 7)),
      ),
      LoanListItem(
        studentName: 'Jane Smith',
        bookName: 'Dart Programming',
        loanDate: DateTime.now(),
        returnDate: DateTime.now().add(Duration(days: 10)),
      ),
      // Puedes agregar más elementos aquí según tu lógica o datos
    ];

    return CustomScaffold(
      title: 'Historial Préstamos',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TODO: Lógica para mostrar el historial de préstamos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20), // Espacio entre el texto y los préstamos

              // Mostrar los elementos de la lista de préstamos
              ListView.builder(
                shrinkWrap: true,
                itemCount: loanItems.length,
                itemBuilder: (context, index) {
                  return loanItems[index];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
