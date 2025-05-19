import 'package:flutter/foundation.dart';
import 'package:flutter_2/models/user_model2.dart';
import 'package:http/http.dart' as http;

class UserService {
  static String baseUrl = "http://localhost:8080";

  static Future<dynamic> getUserData({int page = 0, int perPage = 10}) async {
    var url = "$baseUrl/user?page=$page&per_page=$perPage";
    var response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        return compute(userModel2FromJson, response.body);
      }
    } catch (e) {
      throw Exception("Error Network");
    }
  }
}
