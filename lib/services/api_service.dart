import 'dart:ffi';

import 'package:http/http.dart' as http;

class ApiService{
  static Future<http.Response> getTasks(int userId) async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/users/$userId/tasks");
      http.Response response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception('Bad status code');
      }
      return response;
    } catch (e) {
      throw Exception('Failed to request network call: $e');
    }
  }

}