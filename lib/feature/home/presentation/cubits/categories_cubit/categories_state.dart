import 'package:shop/feature/home/data/models/categories_model/categories_model.dart';

abstract class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final List<CategoryModel> categories;

  CategoriesSuccessState(this.categories);
}

class CategoriesFailureState extends CategoriesState {
  final String error;

  CategoriesFailureState(this.error);
}
