import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AcuraryFinal extends StatefulWidget {
  const AcuraryFinal({super.key});

  @override
  State<AcuraryFinal> createState() => _AcuraryFinalState();
}

class _AcuraryFinalState extends State<AcuraryFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 300,
            height: 300,
            color: Colors.white,
            child: Lottie.asset(
              'assets/lottie/champion.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            )),
        const SizedBox(height: 20),
        const Text(
          'Parabéns!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0819D3),
          ),
        ),
        const Text(
          'Você completou todas as palavras',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Reiniciar'),
        ),
      ],
    )));
  }
}
