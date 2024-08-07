import 'package:aulas_betha/data/api_repository.dart';
import 'package:aulas_betha/domain/entities/user.dart';
import 'package:flutter/material.dart';

class ReadUsers extends StatefulWidget {
  const ReadUsers({super.key});

  @override
  State<ReadUsers> createState() => _ReadUsersState();
}

class _ReadUsersState extends State<ReadUsers> {
  late ApiRepository userRepository = ApiRepository();
  List<User> users = [];

  readUsers() async {
    userRepository = ApiRepository();
    users = await userRepository.getUsers();
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
                readUsers();
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
                    trailing: Text(
                      users[index].id.toString(),
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
