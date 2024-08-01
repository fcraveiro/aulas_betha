import 'package:aulas_betha/domain/entities/user.dart';
import 'package:dio/dio.dart';

class UserRepository {
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
}
