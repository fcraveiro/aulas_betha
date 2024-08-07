import 'package:flutter/material.dart';

class CardTwo extends StatefulWidget {
  const CardTwo({super.key});

  @override
  State<CardTwo> createState() => _CardTwoState();
}

class _CardTwoState extends State<CardTwo> {
  List<String> cards = List.generate(10, (index) => 'Card ${index + 1}');
  double dragPosition = 0;
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Deck - Left Swipe Only')),
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          setState(() {
            isDragging = true;
          });
        },
        onHorizontalDragUpdate: (details) {
          setState(() {
            // Permitir apenas movimento para a esquerda
            if (details.delta.dx < 0) {
              dragPosition += details.delta.dx;
              // Limitar o arrasto para não ir além da borda esquerda
              dragPosition =
                  dragPosition.clamp(-MediaQuery.of(context).size.width, 0);
            }
          });
        },
        onHorizontalDragEnd: (details) {
          setState(() {
            isDragging = false;
            if (dragPosition.abs() > MediaQuery.of(context).size.width / 2) {
              String topCard = cards.removeAt(0);
              cards.add(topCard);
            }
            dragPosition = 0;
          });
        },
        child: Stack(
          children: [
            for (int i = cards.length - 1; i >= 0; i--)
              Positioned(
                top: 20.0 * i,
                left: i == 0 ? dragPosition : 0,
                child: Card(
                  child: Container(
                    width: 300,
                    height: 200,
                    alignment: Alignment.center,
                    child: Text(cards[i], style: const TextStyle(fontSize: 24)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
