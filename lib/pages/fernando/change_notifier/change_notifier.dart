import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Certifique-se de adicionar o provider ao pubspec.yaml

class AppState extends ChangeNotifier {
  int _counter = 0;
  bool _isTrue = false;
  String _text = "Texto Inicial";

  // Getters
  int get counter => _counter;
  bool get isTrue => _isTrue;
  String get text => _text;

  // Métodos para alterar os valores
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void toggleBool() {
    _isTrue = !_isTrue;
    notifyListeners();
  }

  void updateText(String newText) {
    _text = newText;
    notifyListeners();
  }
}

ativar() {
  _overlayController.toggle();
}

var _overlayController = OverlayPortalController();

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    _overlayController.show();
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Page with ChangeNotifier')),
        body: Consumer<AppState>(
          builder: (context, app2State, _) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contador: ${app2State.counter}',
                      style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 16),
                  Text('Bool: ${app2State.isTrue ? "Verdadeiro" : "Falso"}',
                      style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 16),
                  Text('Texto: ${app2State.text}',
                      style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 12),
                  app2State.isTrue
                      ? const Text('Olá, eu sou um overlay!',
                          style: TextStyle(fontSize: 20, color: Colors.black))
                      : const SizedBox(),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => app2State.incrementCounter(),
                        child: const Text('Incrementar Contador'),
                      ),
                      ElevatedButton(
                        onPressed: () => app2State.toggleBool(),
                        child: const Text('Alternar Bool'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    onChanged: (value) => app2State.updateText(value),
                    decoration: const InputDecoration(
                      labelText: 'Atualizar Texto',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
