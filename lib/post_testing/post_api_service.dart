import 'dart:convert';

import 'package:http/http.dart' as http;

import 'post_model.dart';

class PostApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<String> insertPost(PostModel item) async {
    try {
      http.Response response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode(item.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        throw Exception("Error ${response.statusCode} and ${response.body}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }

  Future<String> updatePost(PostModel item) async {
    try {
      http.Response response = await http.put(
        Uri.parse("$baseUrl/${item.id}"),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode(item.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        throw Exception("Error ${response.statusCode} and ${response.body}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }

  Future<String> deletePost(PostModel item) async {
    try {
      http.Response response = await http.delete(
        Uri.parse("$baseUrl/${item.id}"),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        throw Exception("Error ${response.statusCode} and ${response.body}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }
}
