import 'package:flutter/foundation.dart';
import 'package:flutter_2/models/game_model.dart';
import 'package:flutter_2/models/product_categories.dart';
import 'package:flutter_2/models/product_model.dart';
import 'package:flutter_2/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ProductModel>> getProducts() async {
    var url = "https://fakestoreapi.com/products";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return compute(productModelFromJson, response.body);
      } else {
        throw Exception(
            "Error Exception ${response.statusCode} & ${response.body}");
      }
    } catch (e) {
      throw Exception("Error Network $e");
    }
  }

  static Future<List<String>> getProductCategories() async {
    var url = "https://fakestoreapi.com/products/categories";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return compute(productCategoriModelFromJson, response.body);
      } else {
        throw Exception(
            "Error Exception ${response.statusCode} & ${response.body}");
      }
    } catch (e) {
      throw Exception("Error Network $e");
    }
  }

  static Future<List<UserModel>> getUsers() async {
    var url = 'https://fakestoreapi.com/users';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return compute(userModelFromJson, response.body);
      } else {
        throw Exception(
            "Error Exception ${response.statusCode} & ${response.body}");
      }
    } catch (e) {
      throw Exception("Error Network $e");
    }
  }

  static Future<List<GameModel>> getGame() async {
    const url = "https://www.gamerpower.com/api/giveaways";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return compute(gameModelFromJson, response.body);
      } else {
        throw Exception("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }
}
