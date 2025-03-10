import 'package:flutter/material.dart';
import 'package:flutter_bloc1/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.name),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          // Lógica para eliminar la categoría
        },
      ),
      onTap: () {
        // Navegar a la pantalla de edición de categoría
      },
    );
  }
}
