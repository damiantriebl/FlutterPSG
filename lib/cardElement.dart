import 'package:flutter/material.dart';
import 'package:charla/model/futbol.dart';

class CardElement extends StatelessWidget {
  List<Player> player = [];
  CardElement({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: player.length,
        itemBuilder: (ctx, idx) {
          return Column(
            children: [
              Image.network(player[idx].photo, fit: BoxFit.fill, height: 300),
              Text(
                player[idx].name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          );
        },
      ),
    );
  }
}
