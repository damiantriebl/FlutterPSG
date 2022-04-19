import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:charla/model/player.dart';
import 'package:charla/States/players.dart';

class PlayersDbService {
  static Future<List<Player>> getJugadores() async {
    Map<String, String> headers = {
      'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com',
      'X-RapidAPI-Key': '08432d3798msh0157996aa666489p18c199jsn6c221a1cd6a6'
    };
    var url = Uri.parse(
        "https://api-football-v1.p.rapidapi.com/v3/players/squads?team=85");
    final respuesta = await http.get(url, headers: headers);
    if (respuesta.statusCode == 200) {
      final respuestaJson = json.decode(respuesta.body);
      final jugadores =
          Players.fromJsonList(respuestaJson['response']['players']);
      return jugadores;
    }
    return <Player>[];
  }
}
