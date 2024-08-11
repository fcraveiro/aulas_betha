import 'package:aulas_betha/data/api_repository.dart';
import 'package:aulas_betha/domain/entities/albums.dart';
import 'package:flutter/material.dart';

class ReadAlbums extends StatefulWidget {
  const ReadAlbums({super.key});

  @override
  State<ReadAlbums> createState() => _ReadAlbumsState();
}

class _ReadAlbumsState extends State<ReadAlbums> {
  late ApiRepository userRepository = ApiRepository();
  List<Albums> albums = [];

  readAlbums() async {
    userRepository = ApiRepository();
    albums = await userRepository.getAlbums();
    setState(() {
      albums = albums;
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
                readAlbums();
              },
              child: const Text('Clique aqui'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: albums.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      albums[index].userId.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 23),
                    ),
                    subtitle: Text(
                      albums[index].title,
                      style: const TextStyle(color: Colors.black, fontSize: 28),
                    ),
                    trailing: Text(
                      albums[index].id.toString(),
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
