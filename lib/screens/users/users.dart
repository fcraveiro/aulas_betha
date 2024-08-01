import 'dart:developer';

import 'package:aulas_betha/domain/entities/user.dart';
import 'package:aulas_betha/_data/user_repository/user_repository.dart';
import 'package:flutter/material.dart';

class ReadUsers extends StatefulWidget {
  const ReadUsers({super.key});

  @override
  State<ReadUsers> createState() => _ReadUsersState();
}

class _ReadUsersState extends State<ReadUsers> {
  late UserRepository userRepository = UserRepository();
  List<User> users = [];

  ler() async {
    userRepository = UserRepository();
    users = await userRepository.getUsers();
    log(' name ${users[1].name}');
    log(' name ${users[1].username}');
    setState(() {
      users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: () {
                ler();
              },
              child: const Text('Clique aqui'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      users[index].name,
                      style: const TextStyle(color: Colors.black, fontSize: 23),
                    ),
                    subtitle: Text(
                      users[index].username,
                      style: const TextStyle(color: Colors.black, fontSize: 28),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
