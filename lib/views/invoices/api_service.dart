import 'dart:convert';

import 'package:darkshop/data/models/invoices.dart';
import 'package:http/http.dart' as http;

import '../../data/models/user.dart';

class ApiService {
  final String baseUrl = 'http:localhost:3000';

  //GET ALL INVOICE
  Future<List<Invoice>> getAllUsers(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((json) => Invoice.fromJson(json)).toList();
    } else {
      throw Exception('Failed'); 
    }
  }

  //GET ONE
  Future<http.Response> get(String endpoint, int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint/:$id'));
    return response;
  }

  //POST
  Future<http.Response> post(String endpoint, dynamic body) async {
    final response = await http.post(
      Uri.https('$baseUrl/$endpoint'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  //PUT
  Future<http.Response> put(String endpoint, dynamic body, int id) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint/:$id'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  //DELETE
  Future<http.Response> delete(String endpoint, int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint/:$id'));
    return response;
  }
}
