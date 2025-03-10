part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategoriesEvent extends CategoryEvent {}

class AddCategoryEvent extends CategoryEvent {
  final Category category;

  AddCategoryEvent({required this.category});

  @override
  List<Object> get props => [category];
}

class UpdateCategoryEvent extends CategoryEvent {
  final Category category;

  UpdateCategoryEvent({required this.category});

  @override
  List<Object> get props => [category];
}

class DeleteCategoryEvent extends CategoryEvent {
  final String categoryId;

  DeleteCategoryEvent({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}
