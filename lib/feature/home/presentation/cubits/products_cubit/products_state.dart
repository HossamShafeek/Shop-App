
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<ProductModel> products;

  ProductsSuccessState(this.products);
}

class ProductsFailureState extends ProductsState {
  final String error;

  ProductsFailureState(this.error);
}

class GetSearchedProductsList extends ProductsState {}

class ChangeIsSearchingState extends ProductsState {}
