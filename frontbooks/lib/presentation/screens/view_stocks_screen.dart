import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontbooks/config/API/endpoints_api.dart';
import 'package:frontbooks/presentation/widgets/custom_scaffold.dart';
import 'package:frontbooks/presentation/widgets/loan_stocks_item.dart';
import 'package:http/http.dart' as http;

class ViewStocksScreen extends StatefulWidget {
  const ViewStocksScreen({Key? key}) : super(key: key);

  @override
  State<ViewStocksScreen> createState() => _ViewStocksScreenState();
}

class _ViewStocksScreenState extends State<ViewStocksScreen> {
  final _searchController = TextEditingController();
  List<Map<String, int>> filteredStocks = [];

  @override
  void initState() {
    super.initState();
    fetchStocksFromEndpoint(context);
  }

  Future<bool> fetchStocksFromEndpoint(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse(Endpoints.stocks),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          filteredStocks = data
              .map<Map<String, int>>((item) => {
                    'quantity': item['quantity'],
                    'bookId': item['book_id'],
                    'standId': item['stand_id']
                  })
              .toList();
        });
        print('Datos de stocks recibidos correctamente');
        return true;
      } else {
        print('Error al obtener los datos de stocks: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al obtener los datos de stocks'),
          ),
        );
        return false;
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al obtener los datos de stocks'),
        ),
      );
      return false;
    }
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
                decoration: const InputDecoration(
                  hintText: 'Buscar por nombre del libro',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    // Filtrar los stocks según el valor ingresado en el campo de búsqueda
                    filteredStocks = filteredStocks
                        .where((stock) =>
                            stock['quantity']
                                .toString()
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                            stock['bookId']
                                .toString()
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                            stock['standId']
                                .toString()
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
              const SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredStocks.length,
                itemBuilder: (context, index) {
                  final stock = filteredStocks[index];
                  return LoanStocksItem(
                    quantity: stock['quantity']!,
                    bookId: stock['bookId']!,
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
