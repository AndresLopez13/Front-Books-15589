import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/widgets/custom_scaffold.dart';
import 'package:frontbooks/utils/colors.dart';
import 'package:frontbooks/presentation/widgets/loan_book_item.dart'; // Importa el widget LoanBookItem

class ViewBooksScreen extends StatefulWidget {
  const ViewBooksScreen({Key? key}) : super(key: key);

  @override
  State<ViewBooksScreen> createState() => _ViewBooksScreenState();
}

class _ViewBooksScreenState extends State<ViewBooksScreen> {
  final _searchController = TextEditingController();
  List<Map<String, String>> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks = books; // Inicializa la lista de libros filtrados con todos los libros al inicio
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
      title: 'Lista de Libros',
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
                  hintText: 'Buscar por título de libro',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    filteredBooks = books
                        .where((book) =>
                            book['title']!.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
              const SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = filteredBooks[index];
                  return LoanBookItem(
                    bookTitle: book['title']!,
                    bookAuthor: book['author']!,
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

// Lista de libros de ejemplo (reemplazar con tu propia lista de libros)
final List<Map<String, String>> books = [
  {'title': 'El nombre del viento', 'author': 'Patrick Rothfuss'},
  {'title': 'Cien años de soledad', 'author': 'Gabriel García Márquez'},
  {'title': '1984', 'author': 'George Orwell'},
  {'title': 'El señor de los anillos', 'author': 'J.R.R. Tolkien'},
];
