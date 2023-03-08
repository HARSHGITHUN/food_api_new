import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodService {
  static const  String _baseUrl = "https://apimeme.com/?ref=apilist.fun";

  static Future<List<Food>> getFoods() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return (json as List).map((foodJson) => Food.fromJson(foodJson)).toList();
    } else {
      throw Exception('Failed to fetch foods');
    }
  }
}
class Food {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}

