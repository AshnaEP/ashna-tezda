import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product_list_model.dart';

class ApiService {
  static const String apiUrl = 'https://fakestoreapi.com/products';

  static Future<List<ProductListModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<ProductListModel> products = body.map((dynamic item) => ProductListModel.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}