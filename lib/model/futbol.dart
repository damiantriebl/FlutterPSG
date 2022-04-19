// To parse required this JSON data, do
//
//     final futbol = futbolFromJson(jsonString);

import 'dart:convert';

class Futbol {
  Futbol({
    required this.futbolGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String futbolGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  factory Futbol.fromRawJson(String str) => Futbol.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Futbol.fromJson(Map<String, dynamic> json) => Futbol(
        futbolGet: json["get"],
        parameters: Parameters.fromJson(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": futbolGet,
        "parameters": parameters.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "paging": paging.toJson(),
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Paging {
  Paging({
    required this.current,
    required this.total,
  });

  int current;
  int total;

  factory Paging.fromRawJson(String str) => Paging.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        current: json["current"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "total": total,
      };
}

class Parameters {
  Parameters({
    required this.team,
  });

  String team;

  factory Parameters.fromRawJson(String str) =>
      Parameters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        team: json["team"],
      );

  Map<String, dynamic> toJson() => {
        "team": team,
      };
}

class Response {
  Response({
    required this.team,
    required this.players,
  });

  Team team;
  List<Player> players;

  factory Response.fromRawJson(String str) =>
      Response.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        team: Team.fromJson(json["team"]),
        players:
            List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "team": team.toJson(),
        "players": List<dynamic>.from(players.map((x) => x.toJson())),
      };
}

class Player {
  Player({
    required this.id,
    required this.name,
    required this.age,
    required this.position,
    required this.photo,
  });

  int id;
  String name;
  int age;
  String position;
  String photo;

  factory Player.fromRawJson(String str) => Player.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
        position: json["position"] == null ? null : json["position"],
        photo: json["photo"] == null ? null : json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "position": position,
        "photo": photo,
      };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.logo,
  });

  int id;
  String name;
  String logo;

  factory Team.fromRawJson(String str) => Team.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
      };
}
