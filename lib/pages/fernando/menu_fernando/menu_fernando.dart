import 'package:aulas_betha/pages/fernando/acuracy/acuracy.dart';
import 'package:aulas_betha/pages/fernando/cards/card_one/card_one.dart';
import 'package:aulas_betha/pages/fernando/cards/card_two/card_two.dart';
import 'package:aulas_betha/pages/fernando/change_notifier_test/change_notifier_test.dart';
import 'package:aulas_betha/pages/fernando/notfier_plug_test/notfier_plug_test.dart';
import 'package:aulas_betha/pages/fernando/overlay_portal/overlay_portal.dart';
import 'package:aulas_betha/pages/fernando/responsive_page/responsive_page.dart';
import 'package:aulas_betha/pages/fernando/responsive_page_two/responsive_page_two.dart';
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

  appPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AppPage()));
  }

  testNotifier() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const TestNotifier()));
  }

  responsivePage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ResponsivePage()));
  }

  responsivePageTwo() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ResponsivePageTwo()));
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
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => appPage(),
              child: const Text('AppPage'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => testNotifier(),
              child: const Text('Teste Notfier'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => responsivePage(),
              child: const Text('Pagina Responsiva'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => responsivePageTwo(),
              child: const Text('Pagina Responsiva 2'),
            ),
          ],
        ),
      ),
    );
  }
}
