import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc1/models/category_model.dart';
import 'package:flutter_bloc1/repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is LoadCategoriesEvent) {
      yield CategoryLoading();
      try {
        final categories = await categoryRepository.getCategories();
        yield CategoryLoaded(categories: categories);
      } catch (e) {
        yield CategoryError(message: e.toString());
      }
    } else if (event is AddCategoryEvent) {
      yield CategoryLoading();
      try {
        await categoryRepository.addCategory(event.category);
        final categories = await categoryRepository.getCategories();
        yield CategoryLoaded(categories: categories);
      } catch (e) {
        yield CategoryError(message: e.toString());
      }
    } else if (event is UpdateCategoryEvent) {
      yield CategoryLoading();
      try {
        await categoryRepository.updateCategory(event.category);
        final categories = await categoryRepository.getCategories();
        yield CategoryLoaded(categories: categories);
      } catch (e) {
        yield CategoryError(message: e.toString());
      }
    } else if (event is DeleteCategoryEvent) {
      yield CategoryLoading();
      try {
        await categoryRepository.deleteCategory(event.categoryId);
        final categories = await categoryRepository.getCategories();
        yield CategoryLoaded(categories: categories);
      } catch (e) {
        yield CategoryError(message: e.toString());
      }
    }
  }
}
