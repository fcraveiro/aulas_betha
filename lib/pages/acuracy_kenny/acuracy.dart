import 'package:aulas_betha/pages/acuracy_kenny/acurary_final.dart';
import 'package:flutter/material.dart';

class Acuracy extends StatefulWidget {
  const Acuracy({super.key});

  @override
  State<Acuracy> createState() => _AcuracyState();
}

class _AcuracyState extends State<Acuracy> {
  final TextEditingController _textEditingController = TextEditingController();
  String _result = '';
  int _currentWordIndex = 0;
  final List<String> _words = [
    "apple",
    "banana",
    // "cherry",
    "grape",
    // "lemon"
  ];

  int levenshteinDistance(String s, String t) {
    s = s.toLowerCase();
    t = t.toLowerCase();

    if (s == t) return 0;
    if (s.isEmpty) return t.length;
    if (t.isEmpty) return s.length;

    List<List<int>> v = List.generate(
        s.length + 1, (i) => List<int>.generate(t.length + 1, (j) => 0));

    for (int i = 0; i <= s.length; i++) {
      v[i][0] = i;
    }
    for (int j = 0; j <= t.length; j++) {
      v[0][j] = j;
    }

    for (int i = 1; i <= s.length; i++) {
      for (int j = 1; j <= t.length; j++) {
        int cost = (s[i - 1] == t[j - 1]) ? 0 : 1;
        v[i][j] = [
          v[i - 1][j] + 1, // deleção
          v[i][j - 1] + 1, // inserção
          v[i - 1][j - 1] + cost // substituição
        ].reduce((a, b) => a < b ? a : b);
      }
    }

    return v[s.length][t.length];
  }

  double calculateAccuracy(String original, String input) {
    int distance = levenshteinDistance(original, input);
    return (1 - distance / original.length) * 100;
  }

  String classifyAccuracy(double accuracy) {
    if (accuracy >= 90) {
      return "Certa";
    } else if (accuracy >= 50) {
      return "Meia certa";
    } else {
      return "Errada";
    }
  }

  void _calculateAccuracy() {
    String correctWord = _words[_currentWordIndex];
    String userInput = _textEditingController.text;

    double accuracy = calculateAccuracy(correctWord, userInput);
    String classification = classifyAccuracy(accuracy);

    if (accuracy >= 90) {
      if (_currentWordIndex < _words.length - 1) {
        setState(() {
          _currentWordIndex++;
          _textEditingController.clear();
          _result = "Parabéns! Próxima palavra.";
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AcuraryFinal(),
          ),
        ).then((_) {
          _resetGame();
        });
      }
    } else {
      setState(() {
        _result =
            "Acurácia para '$userInput': ${accuracy.toStringAsFixed(2)}% - $classification. Tente novamente.";
      });
    }
  }

  void _resetGame() {
    setState(() {
      _currentWordIndex = 0;
      _textEditingController.clear();
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encontre as palavras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Palavra ${_currentWordIndex + 1} de ${_words.length}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite a palavra',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateAccuracy,
              child: const Text('Verificar Palavra'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _result,
              style: const TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parabéns!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Você completou todas as palavras!',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Recomeçar'),
            ),
          ],
        ),
      ),
    );
  }
}
