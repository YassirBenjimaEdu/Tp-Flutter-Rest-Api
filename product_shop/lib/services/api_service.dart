import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ApiService {
  static const baseUrl = 'http://localhost:8080/api';

  Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body) as List;
      return data.map((j) => Product.fromJson(j as Map<String, dynamic>)).toList();
    }
    throw Exception('Erreur chargement');
  }

  Future<Product> getProductById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body) as Map<String, dynamic>);
    }
    throw Exception('Produit non trouvé');
  }
}

