import 'package:aulas_betha/pages/acuracy/acuracy.dart';
import 'package:aulas_betha/pages/cards/card_one/card_one.dart';
import 'package:aulas_betha/pages/cards/card_two/card_two.dart';
import 'package:aulas_betha/pages/users/users.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  readUsers() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ReadUsers()));
  }

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
              onPressed: () => readUsers(),
              child: const Text('Usuários'),
            ),
          ],
        ),
      ),
    );
  }
}
