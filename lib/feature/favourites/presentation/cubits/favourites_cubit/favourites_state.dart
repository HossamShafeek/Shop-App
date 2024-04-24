import 'package:shop/feature/home/data/models/product_model/product_model.dart';

abstract class FavouritesState {}

final class GetFavouritesInitialState extends FavouritesState {}

class GetFavouritesLoadingState extends FavouritesState {}

class GetFavouritesSuccessState extends FavouritesState {
  final List<ProductModel> products;

  GetFavouritesSuccessState(this.products);
}

class GetFavouritesFailureState extends FavouritesState {
  final String error;
  GetFavouritesFailureState(this.error);
}

class AddToFavouritesLoadingState extends FavouritesState {}

class AddToFavouritesSuccessState extends FavouritesState {
  final String message;

  AddToFavouritesSuccessState(this.message);
}

class AddToFavouritesFailureState extends FavouritesState {
  final String error;

  AddToFavouritesFailureState(this.error);
}

class RemoveFromFavouritesLoadingState extends FavouritesState {}

class RemoveFromFavouritesSuccessState extends FavouritesState {
  final String message;

  RemoveFromFavouritesSuccessState(this.message);
}

class RemoveFromFavouritesFailureState extends FavouritesState {
  final String error;

  RemoveFromFavouritesFailureState(this.error);
}