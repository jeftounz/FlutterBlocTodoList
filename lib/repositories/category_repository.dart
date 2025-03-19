import 'package:flutter_bloc1/models/category_model.dart';
import 'package:flutter_bloc1/services/database_helper.dart';

class CategoryRepository {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<List<Category>> getCategories() async {
    final categories = await dbHelper.getCategories();
    return categories.map((category) => Category.fromMap(category)).toList();
  }

  Future<void> addCategory(Category category) async {
    await dbHelper.createCategory(category.name);
  }

  Future<void> updateCategory(Category category) async {
    await dbHelper.updateCategory(
      category.id,
      category.name,
    ); /* The argument type 'String' can't be assigned to the parameter type 'int'. dartargument_type_not_assignable
String get id*/
  }

  Future<void> deleteCategory(String categoryId) async {
    await dbHelper.deleteCategory(int.parse(categoryId));
  }
}
