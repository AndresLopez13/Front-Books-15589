import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/widgets/custom_scaffold.dart';
import 'package:frontbooks/presentation/widgets/loan_stocks_item.dart';

class ViewStocksScreen extends StatefulWidget {
  const ViewStocksScreen({Key? key}) : super(key: key);

  @override
  State<ViewStocksScreen> createState() => _ViewStocksScreenState();
}

class _ViewStocksScreenState extends State<ViewStocksScreen> {
  final _searchController = TextEditingController();
  List<Map<String, String>> filteredStocks = [];

  @override
  void initState() {
    super.initState();
    filteredStocks = stocks; // Inicializa la lista de stocks filtrados con todos los stocks al inicio
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
      title: 'Lista de Stocks',
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar por nombre del libro',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    filteredStocks = stocks
                        .where((stock) =>
                            stock['bookName']!
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                            stock['standId']!
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
              SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredStocks.length,
                itemBuilder: (context, index) {
                  final stock = filteredStocks[index];
                  return LoanStocksItem(
                    quantity: stock['quantity']!,
                    bookName: stock['bookName']!,
                    standId: stock['standId']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Lista de stocks de ejemplo (reemplazar con tu propia lista de stocks)
final List<Map<String, String>> stocks = [
  {'quantity': '10', 'bookName': 'El nombre del viento', 'standId': '001'},
  {'quantity': '15', 'bookName': 'Cien años de soledad', 'standId': '002'},
  {'quantity': '20', 'bookName': '1984', 'standId': '003'},
  {'quantity': '12', 'bookName': 'El señor de los anillos', 'standId': '004'},
];
