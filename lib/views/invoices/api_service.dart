import 'dart:convert';
import 'package:darkshop/data/models/invoices.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../../data/models/address.dart';
import '../../data/models/invoice_details.dart';
import '../../data/models/invoices.dart';
import '../../data/models/pay.dart';
import '../../data/models/product2.dart';
import '../../data/models/user2.dart';

//192.168.100.144

class ApiService {
  //GET ALL INVOICE
  Future<List<Invoice>> getAllInvoices(String endpoint) async {
    final response =
        await http.get(Uri.parse('${Constants.hosting}/$endpoint'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((json) => Invoice.fromJson(json)).toList();
    } else {
      throw Exception(
          'Failed: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

  //GET ALL User2S
  Future<List<User2>> getAllUsers(String endpoint) async {
    final response =
        await http.get(Uri.parse('${Constants.hosting}/$endpoint'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((json) => User2.fromJson(json)).toList();
    } else {
      throw Exception(
          'Failed: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

  //GET ALL INVOICE DETAILS
  Future<List<InvoiceDetails>> getAllInvoiceDetails(String endpoint) async {
    final response =
        await http.get(Uri.parse('${Constants.hosting}/$endpoint'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((json) => InvoiceDetails.fromJson(json)).toList();
    } else {
      throw Exception(
          'Failed: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

  //GET ALL PRODUCTS
  Future<List<Product2>> getAllProducts(String endpoint) async {
    final response =
        await http.get(Uri.parse('${Constants.hosting}/$endpoint'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((json) => Product2.fromJson(json)).toList();
    } else {
      throw Exception(
          'Failed: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

  //GET ONE User2
  Future<User2> getUser(String endpoint, int id) async {
    final response =
        await http.get(Uri.parse('${Constants.hosting}/$endpoint/$id'));

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      return User2.fromJson(responseData);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //GET ONE PAY
  Future<Pay> getPay(String endpoint, int id) async {
    final response =
        await http.get(Uri.parse('${Constants.hosting}/$endpoint/$id'));

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      return Pay.fromJson(responseData);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //GET ONE ADDRESS
  Future<Address> getAddress(String endpoint, int id) async {
    final response =
        await http.get(Uri.parse('${Constants.hosting}/$endpoint/$id'));

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      return Address.fromJson(responseData);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //GET ONE INVOICE
  Future<Invoice> getInvoice(String endpoint, int id) async {
    final response = await http.get(
      Uri.parse('${Constants.hosting}/$endpoint/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData.isNotEmpty) {
        final dynamic invoiceData = responseData.first;
        return Invoice.fromJson(invoiceData);
      } else {
        throw Exception('Invoice not found');
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //GET ONE INVOICE DETAILS
  Future<InvoiceDetails> getInvoiceDetails(String endpoint, int id) async {
    final response = await http.get(
      Uri.parse('${Constants.hosting}/$endpoint/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData.isNotEmpty) {
        final dynamic invoiceData = responseData.first;
        return InvoiceDetails.fromJson(invoiceData);
      } else {
        throw Exception('Invoice not found');
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //CREATE ONT INVOICE
  Future<Invoice> createInvoice(String endpoint, Invoice invoice) async {
    final response = await http.post(
      Uri.parse('${Constants.hosting}/$endpoint'),
      body: jsonEncode(invoice),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      final dynamic responseData = jsonDecode(response.body);
      return Invoice.fromJson(responseData);
    } else {
      throw Exception('Failed to create Invoice');
    }
  }

  //UPDATE INVOICE
  Future<Invoice> updateInvoice(
      String endpoint, Invoice invoice, int id) async {
    final response = await http.put(
      Uri.parse('${Constants.hosting}/$endpoint/$id'),
      body: jsonEncode(invoice),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      return Invoice.fromJson(responseData);
    } else {
      throw Exception('Failed to update Invoice');
    }
  }

  Future<void> updateInvoiceStatus2(int invoiceId) async {
    Map<String, dynamic> body = {'id': invoiceId.toString(), 'status': '2'};
    final response = await http
        .put(Uri.parse('${Constants.hosting}/invoices/$invoiceId'), body: body);

    if (response.statusCode == 200) {
      print('Invoice updated successfully');
    } else {
      print('Failed to update invoice');
    }
  }

  Future<void> updateInvoiceStatus5(int invoiceId) async {
    Map<String, dynamic> body = {'id': invoiceId.toString(), 'status': '5'};
    final response = await http
        .put(Uri.parse('${Constants.hosting}/invoices/$invoiceId'), body: body);

    if (response.statusCode == 200) {
      print('Invoice updated successfully');
    } else {
      print('Failed to update invoice');
    }
  }

  Future<void> updateInvoiceStatusdemo(int invoiceId) async {
    await Future.delayed(const Duration(seconds: 5));
    Map<String, dynamic> body = {'id': invoiceId.toString(), 'status': '5'};
    final response = await http
        .put(Uri.parse('${Constants.hosting}/invoices/$invoiceId'), body: body);

    if (response.statusCode == 200) {
      print('Invoice updated successfully');
    } else {
      print('Failed to update invoice');
    }
  }

  Future<void> updateInvoiceStatus1(int invoiceId) async {
    Map<String, dynamic> body = {'id': invoiceId.toString(), 'status': '1'};
    final response = await http
        .put(Uri.parse('${Constants.hosting}/invoices/$invoiceId'), body: body);

    if (response.statusCode == 200) {
      print('Invoice updated successfully');
    } else {
      print('Failed to update invoice');
    }
  }

  Future<void> updateInvoiceStatus3(int invoiceId) async {
    Map<String, dynamic> body = {'id': invoiceId.toString(), 'status': '3'};
    final response = await http
        .put(Uri.parse('${Constants.hosting}/invoices/$invoiceId'), body: body);

    if (response.statusCode == 200) {
      print('Invoice updated successfully');
    } else {
      print('Failed to update invoice');
    }
  }

  Future<void> updateInvoiceStatus4(int invoiceId) async {
    await Future.delayed(const Duration(seconds: 10));
    Map<String, dynamic> body = {'id': invoiceId.toString(), 'status': '4'};
    final response = await http
        .put(Uri.parse('${Constants.hosting}/invoices/$invoiceId'), body: body);

    if (response.statusCode == 200) {
      print('Invoice updated successfully');
    } else {
      print('Failed to update invoice');
    }
  }

  //DELETE INVOICE
  Future<void> deleteInvoice(String endpoint, int id) async {
    final response =
        await http.delete(Uri.parse('${Constants.hosting}/$endpoint/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete Invoice');
    }
  }
}
