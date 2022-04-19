import 'dart:convert';
import 'package:charla/cardElement.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charla/model/futbol.dart';

Future<Futbol> getTeam() async {
  Map<String, String> headers = {
    'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com',
    'X-RapidAPI-Key': '08432d3798msh0157996aa666489p18c199jsn6c221a1cd6a6'
  };
  var url = Uri.parse(
      "https://api-football-v1.p.rapidapi.com/v3/players/squads?team=85");
  final response = await http.get(url, headers: headers);
  final jsonFutbol = jsonDecode(response.body);
  return Futbol.fromJson(jsonFutbol);
}

class Presentacion extends StatelessWidget {
  const Presentacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PSG")),
      body: FutureBuilder(
          future: getTeam(),
          builder: (BuildContext context, AsyncSnapshot<Futbol> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                return CardElement(
                    player: snapshot.data!.response.first.players);
              default:
                return const Text('posiblemente un error');
            }
          }),
    );
  }
}
