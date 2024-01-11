import 'dart:convert';

import 'package:darkshop/data/models/invoices.dart';
import 'package:flutter/services.dart';

Future<List<Invoice>> getInvoicesFromJson(String path) async {
  final jsonString = await rootBundle.loadString(path);
  final jsonList = json.decode(jsonString) as List<dynamic>;
  return jsonList.map((json) => Invoice.fromJson(json)).toList();
}
