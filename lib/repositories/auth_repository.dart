import 'package:flutter_bloc1/models/user_model.dart'; // Asegúrate de que la ruta de importación sea correcta

class AuthRepository {
  Future<void> login(String email, String password) async {
    // Simular una llamada a la API
    await Future.delayed(Duration(seconds: 2));
    if (email == 'test@test.com' && password == 'password') {
      // Simular un login exitoso
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<void> signup(String email, String password) async {
    // Simular una llamada a la API
    await Future.delayed(Duration(seconds: 2));
    // Simular un registro exitoso
  }

  Future<void> logout() async {
    // Simular un logout
    await Future.delayed(Duration(seconds: 1));
  }

  Future<User> getCurrentUser() async {
    // Simular la obtención del usuario actual
    await Future.delayed(Duration(seconds: 1));
    return User(
      id: '1',
      email: 'test@test.com',
    ); // Devuelve un objeto User válido
  }
}
