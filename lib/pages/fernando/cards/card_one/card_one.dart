import 'package:aulas_betha/pages/fernando/cards/card_one/card_widget.dart';
import 'package:flutter/material.dart';

class CardOne extends StatefulWidget {
  const CardOne({super.key});

  @override
  State<CardOne> createState() => _CardOneState();
}

class _CardOneState extends State<CardOne> {
  List<Carta> cartas = List.generate(10, (index) => Carta('Carta $index'));
  Offset currentOffset = Offset.zero;

  void _onDismissed() {
    setState(() {
      final carta = cartas.removeAt(0);
      cartas.add(carta);
      currentOffset = Offset.zero;
    });
  }

  void _onDragUpdate(Offset delta) {
    setState(() {
      currentOffset = currentOffset + delta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Baralho')),
      body: Center(
        child: Stack(
          children: cartas.reversed.map((carta) {
            int index = cartas.indexOf(carta);
            return CartaWidget(
              carta: carta,
              onDismissed: index == 0 ? _onDismissed : () {},
              offset: index == 0 ? currentOffset : Offset.zero,
              onDragUpdate: index == 0 ? _onDragUpdate : (offset) {},
            );
          }).toList(),
        ),
      ),
    );
  }
}
