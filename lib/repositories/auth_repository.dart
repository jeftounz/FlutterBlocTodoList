import 'package:flutter_bloc1/services/database_helper.dart';

class AuthRepository {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<void> login(String email, String password) async {
    final user = await dbHelper.loginUser(email, password);
    if (user == null) {
      throw Exception('Credenciales inválidas');
    }
  }

  Future<void> signup(String email, String password) async {
    await dbHelper.registerUser(email, password);
  }
}
