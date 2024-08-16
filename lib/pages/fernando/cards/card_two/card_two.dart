import 'package:flutter/material.dart';

class CardTwo extends StatefulWidget {
  const CardTwo({super.key});

  @override
  State<CardTwo> createState() => _CardTwoState();
}

class _CardTwoState extends State<CardTwo> with TickerProviderStateMixin {
  List<String> cards = List.generate(10, (index) => 'Card ${index + 1}');
  double dragPosition = 0;
  bool isDragging = false;
  late AnimationController _exitAnimationController;
  late AnimationController _entryAnimationController;
  late Animation<Offset> _exitAnimation;
  late Animation<Offset> _entryAnimation;
  int? animatingCardIndex;

  @override
  void initState() {
    super.initState();
    _exitAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _entryAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _exitAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.5, 0),
    ).animate(CurvedAnimation(
      parent: _exitAnimationController,
      curve: Curves.easeInOut,
    ));
    _entryAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _entryAnimationController,
      curve: Curves.easeOutBack,
    ));

    _exitAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          String movedCard = cards.removeAt(0);
          cards.add(movedCard);
          _exitAnimationController.reset();
          _entryAnimationController.forward();
        });
      }
    });

    _entryAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          animatingCardIndex = null;
          _entryAnimationController.reset();
        });
      }
    });
  }

  @override
  void dispose() {
    _exitAnimationController.dispose();
    _entryAnimationController.dispose();
    super.dispose();
  }

  void _startCardAnimation() {
    setState(() {
      animatingCardIndex = 0;
      _exitAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Deck - Consistent Animation')),
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          if (animatingCardIndex == null) {
            setState(() {
              isDragging = true;
              dragPosition = 0;
            });
          }
        },
        onHorizontalDragUpdate: (details) {
          if (animatingCardIndex == null) {
            setState(() {
              if (details.delta.dx < 0) {
                dragPosition += details.delta.dx;
                dragPosition = dragPosition.clamp(
                    -MediaQuery.of(context).size.width / 2, 0);
              }
            });
          }
        },
        onHorizontalDragEnd: (details) {
          if (animatingCardIndex == null) {
            setState(() {
              isDragging = false;
              if (dragPosition.abs() > MediaQuery.of(context).size.width / 4) {
                _startCardAnimation();
              } else {
                dragPosition = 0;
              }
            });
          }
        },
        child: Stack(
          children: [
            for (int i = cards.length - 1; i >= 0; i--)
              Positioned(
                top: 20.0 * i,
                left: 0,
                child: AnimatedBuilder(
                  animation: Listenable.merge(
                      [_exitAnimationController, _entryAnimationController]),
                  builder: (context, child) {
                    Offset offset = Offset.zero;
                    if (i == animatingCardIndex) {
                      offset = _exitAnimation.value;
                    } else if (i == cards.length - 1 &&
                        _entryAnimationController.isAnimating) {
                      offset = _entryAnimation.value;
                    } else if (i == 0 && isDragging) {
                      offset = Offset(
                          dragPosition / MediaQuery.of(context).size.width, 0);
                    }
                    return Transform.translate(
                      offset: offset * MediaQuery.of(context).size.width,
                      child: child,
                    );
                  },
                  child: Card(
                    child: Container(
                      width: 300,
                      height: 200,
                      alignment: Alignment.center,
                      child:
                          Text(cards[i], style: const TextStyle(fontSize: 24)),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
