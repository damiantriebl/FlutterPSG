import 'package:charla/model/futbol.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Player player;
  const DetailsPage({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Player Details")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children: [
            Hero(
              tag: player.id,
              child: Image.network(
                player.photo,
                height: 500.0,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Nombre: ${player.name}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w800)),
                  Text("Posicion: ${player.position}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                  Text(
                    "Edad: ${player.age.toString()}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
