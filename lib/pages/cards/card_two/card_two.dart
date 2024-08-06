import 'package:flutter/material.dart';

class CardTwo extends StatefulWidget {
  const CardTwo({super.key});

  @override
  State<CardTwo> createState() => _CardTwoState();
}

class _CardTwoState extends State<CardTwo> {
  List<String> cards = List.generate(10, (index) => 'Card ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Deck')),
      body: Stack(
        children: cards.asMap().entries.map((entry) {
          int idx = entry.key;
          String card = entry.value;
          return Positioned(
            top: idx * 2.0,
            child: Draggable<String>(
              feedback: CardWidget(card),
              childWhenDragging: Container(),
              onDragEnd: (details) {
                if (details.offset.dx <
                    -MediaQuery.of(context).size.width / 2) {
                  setState(() {
                    cards.removeAt(0);
                    cards.add(card);
                  });
                }
              },
              child: CardWidget(card),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String cardText;

  const CardWidget(this.cardText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child:
          Center(child: Text(cardText, style: const TextStyle(fontSize: 24))),
    );
  }
}
