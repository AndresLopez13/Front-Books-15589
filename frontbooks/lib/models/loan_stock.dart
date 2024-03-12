import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoanStock {
  final int id;
  final int quantity;
  final int bookId;
  final int standId;

  LoanStock({
    required this.id,
    required this.quantity,
    required this.bookId,
    required this.standId,
  });

  factory LoanStock.fromJson(Map<String, dynamic> json) => LoanStock(
        id: json['id'] as int,
        quantity: json['quantity'] as int,
        bookId: json['book_id'] as int,
        standId: json['stand_id'] as int,
      );
}

Future<List<LoanStock>> fetchData() async {
  final response = await http.get(Uri.parse('https://your-api-url.com'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List<dynamic>;
    return data.map((item) => LoanStock.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}