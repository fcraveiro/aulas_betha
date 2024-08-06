import 'package:aulas_betha/domain/entities/albums.dart';
import 'package:aulas_betha/domain/entities/comments.dart';
import 'package:aulas_betha/domain/entities/user.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  final Dio _dio = Dio(); // Cria uma instância de Dio

  Future<List<User>> getUsers() async {
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/users');
      if (response.statusCode == 200) {
        List<User> users =
            (response.data as List).map((json) => User.fromJson(json)).toList();
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }

  Future<List<Comments>> getComments() async {
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/comments');
      if (response.statusCode == 200) {
        List<Comments> comments = (response.data as List)
            .map((json) => Comments.fromJson(json))
            .toList();
        return comments;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }

  Future<List<Albums>> getAlbums() async {
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/albums');
      if (response.statusCode == 200) {
        List<Albums> albums = (response.data as List)
            .map((json) => Albums.fromJson(json))
            .toList();
        return albums;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }
}
