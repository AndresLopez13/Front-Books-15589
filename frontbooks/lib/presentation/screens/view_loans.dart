import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/widgets/custom_scaffold.dart';
import 'package:frontbooks/utils/colors.dart';

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

    return CustomScaffold(
      title: 'Historial Préstamos',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TODO: Lógica para mostrar el historial de préstamos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
