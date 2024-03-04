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
    final bool isDesktop = screenSize.width > 600;

    final double contentWidth =
        isDesktop ? screenSize.width * 0.6 : screenSize.width;

    final double buttonFontSize = isDesktop ? 18 : 14;
    final double horizontalPadding = isDesktop ? contentWidth * 0.35 : 16;

    // Suponiendo que tienes una lista de préstamos, aquí la estoy simulando con datos de ejemplo
    List<Widget> loanItems = [
      const LoanListItem(
        studentName: 'John Doe',
        bookName: 'Flutter for Beginners',
        loanDate: '29/02/2024',
        returnDate: '03/03/2024',
      ),
      const LoanListItem(
        studentName: 'Jane Smith',
        bookName: 'Dart Programming',
        loanDate: '29/02/2024',
        returnDate: '04/03/2024',
      ),
      const LoanListItem(
        studentName: 'Smith Perez',
        bookName: 'Dart Programming',
        loanDate: '29/02/2024',
        returnDate: '04/03/2024',
      ),
      const LoanListItem(
        studentName: 'John Doe',
        bookName: 'Flutter for Beginners',
        loanDate: '29/02/2024',
        returnDate: '03/03/2024',
      ),
      const LoanListItem(
        studentName: 'Jane Smith',
        bookName: 'Dart Programming',
        loanDate: '29/02/2024',
        returnDate: '04/03/2024',
      ),
      const LoanListItem(
        studentName: 'Smith Perez',
        bookName: 'Dart Programming',
        loanDate: '29/02/2024',
        returnDate: '04/03/2024',
      ),
      const LoanListItem(
        studentName: 'John Doe',
        bookName: 'Flutter for Beginners',
        loanDate: '29/02/2024',
        returnDate: '03/03/2024',
      ),
      const LoanListItem(
        studentName: 'Jane Smith',
        bookName: 'Dart Programming',
        loanDate: '29/02/2024',
        returnDate: '04/03/2024',
      ),
      const LoanListItem(
        studentName: 'Smith Perez',
        bookName: 'Dart Programming',
        loanDate: '29/02/2024',
        returnDate: '04/03/2024',
      ),
    ];

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
                  decoration: const InputDecoration(
                    hintText: 'Buscar por nombre de estudiante',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Filtrar los items de la lista según el valor
                    // setState(() {
                    //   loanItems = loanItems
                    //       .where((item) => item.studentName
                    //           .toLowerCase()
                    //           .contains(value.toLowerCase()))
                    //       .toList();
                    // });
                  },
                ),
                const SizedBox(height: 15),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: loanItems.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                  itemBuilder: (context, index) {
                    return loanItems[index];
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
