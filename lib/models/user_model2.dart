import 'dart:convert';

List<UserModel2> userModel2FromJson(String str) =>
    List<UserModel2>.from(json.decode(str).map((x) => UserModel2.fromJson(x)));

String userModel2ToJson(List<UserModel2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel2 {
  int id;
  String firstName;
  String lastName;
  String image;

  UserModel2({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
  });

  factory UserModel2.fromJson(Map<String, dynamic> json) => UserModel2(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "image": image,
      };
}
