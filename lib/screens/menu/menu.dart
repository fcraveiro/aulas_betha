import 'package:aulas_betha/screens/users/users.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  readUsers() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ReadUsers()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                readUsers();
              },
              child: const Text('Pagina 1'),
            ),
          ],
        ),
      ),
    );
  }
}
