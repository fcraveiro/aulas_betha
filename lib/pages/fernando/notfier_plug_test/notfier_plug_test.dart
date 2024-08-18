import 'dart:developer';

import 'package:aulas_betha/pages/fernando/lib/notifier/notifier.dart';
import 'package:aulas_betha/pages/fernando/lib/plug/plug.dart';
import 'package:flutter/material.dart';

class TestNotifier extends StatefulWidget {
  const TestNotifier({super.key});

  @override
  State<TestNotifier> createState() => _TestNotifierState();
}

class _TestNotifierState extends State<TestNotifier> {
  late final Notifier<int> counter = Notifier<int>(0);
  late final Notifier<String> nomes = Notifier<String>('0');
  late final Notifier<bool> falsoVerdadeiro = Notifier<bool>(false);
  late final NotifierList<int> tabela = NotifierList<int>();

  Plug valor1 = Plug();
  Plug valor2 = Plug();
  Plug valor3 = Plug();
  Plug valor4 = Plug();

  @override
  void initState() {
    super.initState();
    chama();
  }

  chama() {
    valor1.then(() {
      log('valor 1 completado ');
    });

    Future.delayed(const Duration(seconds: 2), () {
      log('Enviando valor 1 ...');
      valor1.call(); // Chama o callback sem argumentos
    });

    valor2.take((value) {
      log('valor 2 completado  : $value');
    });

    Future.delayed(const Duration(seconds: 2), () {
      log('Enviando valor 2 ...');
      valor2.send(42); // Chama o callback com um argumento do tipo int
    });

    // Definir um callback que não recebe argumentos
    valor3.then(() {
      log('valor 3 completado ');
    });

    // Simular uma tarefa assíncrona
    Future.delayed(const Duration(seconds: 2), () {
      log('Enviando valor 3 ...');
      valor3.call(); // Chama o callback sem argumentos
    });

    // Definir um callback que recebe um argumento do tipo int
    valor4.take((value) {
      log('valor 4 completado : $value');
    });

    // Simular uma tarefa assíncrona que envia um valor
    Future.delayed(const Duration(seconds: 2), () {
      log('Enviando valor 4 ...');
      valor4.send(56); // Chama o callback com um argumento do tipo int
    });
  }

  @override
  void dispose() {
    counter.dispose();
    super.dispose();
  }

  changeNotifiers() {
    setState(() {
      counter.value++;
      falsoVerdadeiro.value = !falsoVerdadeiro.value;
      tabela.add(counter.value);
      // tabela.add(88);
      // tabela.add(99);
      // tabela.shuffle();
      log(tabela.length.toString());
      log(tabela.value.length.toString());
      if (counter.value == 5) {
        tabela.remove(1);
      }
      if (counter.value == 10) {
        tabela.removeAt(3);
      }
      if (counter.value == 10) {
        tabela.addAll([10, 20, 30, 40, 50, 60, 70, 80, 90, 100]);
      }
      if (counter.value == 15) {
        tabela.removeWhere((item) => item == 10);
      }
      if (counter.value == 20) {
        tabela.insert(1, 88);
      }
      if (counter.value == 25) {
        tabela.shuffle();
      }
      if (counter.value == 30) {
        tabela.sort();
      }
      if (counter.value == 35) {
        tabela.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const SizedBox(height: 40),
          ElevatedButton(
              onPressed: () => changeNotifiers(),
              child: const Text('Click me')),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 40,
            color: Colors.white,
            alignment: Alignment.center,
            child: counter.show((value) {
              return Text(value.toString(),
                  style: const TextStyle(fontSize: 26));
            }),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 40,
            color: Colors.white,
            alignment: Alignment.center,
            child: falsoVerdadeiro.show((value) {
              return Text(value.toString(),
                  style: const TextStyle(fontSize: 26));
            }),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: tabela.show((value) {
              return Wrap(
                children: [
                  Text(tabela.value.toString(),
                      style: const TextStyle(fontSize: 26))
                ],
              );

              //  Wrap(
              //   children: value.map((e) {
              //     return Text('${e.toString()} : ',
              //         style: const TextStyle(fontSize: 26));
              //   }).toList(),
              // );
            }),
          ),
        ],
      )),
    );
  }
}
