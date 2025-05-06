import 'dart:convert';

List<String> productCategoriModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String productCategoriModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
