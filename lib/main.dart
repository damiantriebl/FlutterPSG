import 'dart:convert';

import 'package:charla/Presentacion.dart';
import 'package:flutter/material.dart';
import 'package:charla/model/futbol.dart';
import 'package:http/http.dart' as http;
import 'package:charla/DetailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Presentacion(),
    );
  }
}

Future<Futbol> getFutbol() async {
  Map<String, String> headers = {
    'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com',
    'X-RapidAPI-Key': '08432d3798msh0157996aa666489p18c199jsn6c221a1cd6a6'
  };
  var url = Uri.parse(
      "https://api-football-v1.p.rapidapi.com/v3/players/squads?team=85");
  final respuesta = await http.get(url, headers: headers);
  final jsonFutbol = jsonDecode(respuesta.body);
  return Futbol.fromJson(jsonFutbol);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
      body: Center(
          child: FutureBuilder(
              future: getFutbol(),
              builder: (ctx, AsyncSnapshot snapshop) {
                switch (snapshop.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();

                  case ConnectionState.done:
                    if (snapshop.hasError) {
                      return Text('Error: ${snapshop.error}');
                    }
                    if (snapshop.data != null) {
                      return ListaJugadores(
                          jugadores: snapshop.data.response[0]!.players);
                    }
                    throw '';
                  default:
                    return const Text('Error');
                }
              })),
    );
  }
}

class ListaJugadores extends StatelessWidget {
  final List<Player> jugadores;
  const ListaJugadores({
    Key? key,
    required this.jugadores,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.0,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1),
          itemCount: jugadores.length,
          itemBuilder: (ctx, index) {
            Player jugador = jugadores[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(
                            player: jugador,
                          ))),
              child: Card(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: jugador.id,
                      child: Image.network(
                        jugador.photo,
                        height: 300.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Nombre: ${jugador.name}",
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
