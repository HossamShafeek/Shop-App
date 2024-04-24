import 'package:shop/feature/home/data/models/product_model/product_model.dart';


abstract class MostPopularState {}

final class MostPopularInitial extends MostPopularState {}

class MostPopularLoadingState extends MostPopularState {}

class MostPopularSuccessState extends MostPopularState {
  final List<ProductModel> products;

  MostPopularSuccessState(this.products);
}

class MostPopularFailureState extends MostPopularState {
  final String error;

  MostPopularFailureState(this.error);
}
