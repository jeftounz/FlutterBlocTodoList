import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/blocs/category/category_bloc.dart';
import 'package:flutter_bloc1/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CategoryLoaded) {
          return ListView.builder(
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return CategoryItem(category: category);
            },
          );
        } else if (state is CategoryError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('No categories found'));
        }
      },
    );
  }
}
