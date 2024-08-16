import 'package:flutter/material.dart';

class Carta {
  final String id;
  Carta(this.id);
}

class CartaWidget extends StatelessWidget {
  final Carta carta;
  final VoidCallback onDismissed;
  final Offset offset;
  final ValueChanged<Offset> onDragUpdate;

  const CartaWidget({
    super.key,
    required this.carta,
    required this.onDismissed,
    required this.offset,
    required this.onDragUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: GestureDetector(
        onPanUpdate: (details) {
          onDragUpdate(details.delta);
        },
        onPanEnd: (details) {
          if (offset.dx < -150) {
            onDismissed();
          } else {
            onDragUpdate(Offset.zero);
          }
        },
        child: Card(
          child: SizedBox(
            width: 200,
            height: 300,
            child: Center(child: Text(carta.id)),
          ),
        ),
      ),
    );
  }
}
