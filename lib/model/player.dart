// To parse this JSON data, do
//
//     final Player = PlayerFromJson(jsonString);

import 'dart:convert';

class Player {
  Player({
    required this.id,
    required this.name,
    required this.age,
    required this.number,
    required this.position,
    required this.photo,
  });

  String id;
  String name;
  int age;
  int number;
  String position;
  String photo;

  factory Player.fromRawJson(String str) => Player.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
        number: json["number"] == null ? null : json["number"],
        position: json["position"] == null ? null : json["position"],
        photo: json["photo"] == null ? null : json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "age": age == null ? null : age,
        "number": number == null ? null : number,
        "position": position == null ? null : position,
        "photo": photo == null ? null : photo,
      };
}
