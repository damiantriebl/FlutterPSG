import 'package:charla/model/player.dart';

class Players {
  Players();

  static List<Player> fromJsonList(List<dynamic> jsonList) {
    List<Player> listaJugadores = [];
    for (var jugador in jsonList) {
      final player = Player.fromJson(jugador);
      listaJugadores.add(player);
    }

    return listaJugadores;
  }
}
