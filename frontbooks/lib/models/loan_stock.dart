import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoanStock {
  final int quantity;
  final int bookName;
  final int standId;

  LoanStock({
    required this.quantity,
    required this.bookName,
    required this.standId,
  });

  factory LoanStock.fromJson(Map<String, dynamic> json) {
    return LoanStock(
      quantity: json['quantity'],
      bookName: json['bookName'],
      standId: json['standId'],
    );
  }
}
