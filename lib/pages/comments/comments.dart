import 'package:aulas_betha/data/api_repository.dart';
import 'package:aulas_betha/domain/entities/comments.dart';
import 'package:flutter/material.dart';

class ReadComments extends StatefulWidget {
  const ReadComments({super.key});

  @override
  State<ReadComments> createState() => _ReadCommentsState();
}

class _ReadCommentsState extends State<ReadComments> {
  late ApiRepository userRepository = ApiRepository();
  List<Comments> comments = [];

  ReadComments() async {
    userRepository = ApiRepository();
    comments = (await userRepository.getComments()).cast<Comments>();
    setState(() {
      comments = comments;
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
                ReadComments();
              },
              child: const Text('Clique aqui'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      comments[index].name,
                      style: const TextStyle(color: Colors.black, fontSize: 23),
                    ),
                    subtitle: Text(
                      comments[index].body,
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
