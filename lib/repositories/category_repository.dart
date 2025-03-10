import 'package:flutter_bloc1/models/category_model.dart'; // Asegúrate de que la ruta de importación sea correcta

class CategoryRepository {
  // Simulación de una lista de categorías en memoria
  final List<Category> _categories = [];

  Future<List<Category>> getCategories() async {
    // Simular una operación asíncrona (como una llamada a una API o una consulta a una base de datos)
    await Future.delayed(
      Duration(seconds: 1),
    ); // Simular un retraso de 1 segundo
    return _categories; // Devuelve la lista de categorías
  }

  Future<void> addCategory(Category category) async {
    // Simular una operación asíncrona
    await Future.delayed(Duration(seconds: 1));
    _categories.add(category); // Añade la categoría a la lista
  }

  Future<void> updateCategory(Category category) async {
    // Simular una operación asíncrona
    await Future.delayed(Duration(seconds: 1));
    final index = _categories.indexWhere((c) => c.id == category.id);
    if (index != -1) {
      _categories[index] = category; // Actualiza la categoría en la lista
    }
  }

  Future<void> deleteCategory(String categoryId) async {
    // Simular una operación asíncrona
    await Future.delayed(Duration(seconds: 1));
    _categories.removeWhere(
      (c) => c.id == categoryId,
    ); // Elimina la categoría de la lista
  }
}
