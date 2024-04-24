import 'package:shop/feature/home/data/models/product_model/product_model.dart';

abstract class CartState {}

final class GetCartInitialState extends CartState {}

class GetCartLoadingState extends CartState {}

class GetCartSuccessState extends CartState {
  final List<ProductModel> products;

  GetCartSuccessState(this.products);
}

class GetCartFailureState extends CartState {
  final String error;
  GetCartFailureState(this.error);
}

class AddToCartLoadingState extends CartState {}

class AddToCartSuccessState extends CartState {
  final String message;

  AddToCartSuccessState(this.message);
}

class AddToCartFailureState extends CartState {
  final String error;

  AddToCartFailureState(this.error);
}

class RemoveFromCartLoadingState extends CartState {}

class RemoveFromCartSuccessState extends CartState {
  final String message;

  RemoveFromCartSuccessState(this.message);
}

class RemoveFromCartFailureState extends CartState {
  final String error;

  RemoveFromCartFailureState(this.error);
}

class UpdateCartLoadingState extends CartState {}

class UpdateCartSuccessState extends CartState {
  final String message;

  UpdateCartSuccessState(this.message);
}

class UpdateCartFailureState extends CartState {
  final String error;

  UpdateCartFailureState(this.error);
}