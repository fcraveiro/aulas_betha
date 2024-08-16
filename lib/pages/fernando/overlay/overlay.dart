import 'dart:developer';

import 'package:flutter/material.dart';

class OverlayTest extends StatefulWidget {
  const OverlayTest({super.key});

  @override
  State<OverlayTest> createState() => _OverlayTestState();
}

var _overlayController = OverlayPortalController();
final GlobalKey _elevatedKey = GlobalKey();
double positionedWidth = 0.0;
double positionedHeight = 0.0;

class _OverlayTestState extends State<OverlayTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              key: _elevatedKey,
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  var position = getPosition();
                  log('Posição do container: (${position.dx}, ${position.dy})');
                  positionedHeight = position.dy;
                  positionedWidth = position.dx;
                  _overlayController.toggle();
                });
              },
              child: OverlayPortal(
                controller: _overlayController,
                overlayChildBuilder: (BuildContext context) {
                  return Positioned(
                    top: positionedHeight - 40,
                    left: positionedWidth, // - 70,
                    child: Container(
                      width: 250,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: const Center(
                        child: Text('Olá, eu sou um overlay!',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  );
                },
                child: const Text('Clique aqui'),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  getPosition() {
    final RenderBox renderBox =
        _elevatedKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    return position;
  }
}
