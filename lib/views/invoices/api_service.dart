import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http:localhost:3000';

  //GET ALL
  Future<http.Response> getAll(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return response;
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
