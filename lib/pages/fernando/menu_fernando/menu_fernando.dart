import 'package:aulas_betha/pages/fernando/acuracy/acuracy.dart';
import 'package:aulas_betha/pages/fernando/cards/card_one/card_one.dart';
import 'package:aulas_betha/pages/fernando/cards/card_two/card_two.dart';
import 'package:aulas_betha/pages/fernando/overlay/overlay.dart';
import 'package:flutter/material.dart';

class MenuFernando extends StatefulWidget {
  const MenuFernando({super.key});

  @override
  State<MenuFernando> createState() => _MenuFernandoState();
}

class _MenuFernandoState extends State<MenuFernando> {
  cardOne() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CardOne()));
  }

  cardTwo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CardTwo()));
  }

  acuracy() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Acuracy()));
  }

  overlayTest() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const OverlayTest()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () => cardOne(),
              child: const Text('Cartas 1'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => cardTwo(),
              child: const Text('Cartas 2'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => acuracy(),
              child: const Text('Acurácia'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => overlayTest(),
              child: const Text('Overlay'),
            ),
          ],
        ),
      ),
    );
  }
}
