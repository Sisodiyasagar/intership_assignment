import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intership_assigment/models/item.dart';

class ItemsService {
  final String baseUrl = 'https://6690ea9a26c2a69f6e8da0f7.mockapi.io/items';

  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);

      if (jsonResponse is List) {
        return jsonResponse.map((data) => Item.fromJson(data)).toList();
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Failed to load items');
    }
  }
}
