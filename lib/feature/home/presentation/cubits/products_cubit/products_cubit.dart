import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/data/repository/home_repository.dart';
import 'package:shop/feature/home/presentation/cubits/products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepository) : super(ProductsInitialState());

  static ProductsCubit get(BuildContext context) => BlocProvider.of(context);

  final HomeRepository homeRepository;

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<ProductModel> products = [];

  Future<void> getProducts({required String categoryName}) async {
    emit(ProductsLoadingState());
    Either<Failure, List<ProductModel>> result =
    await homeRepository.getProducts(categoryName: categoryName);
    result.fold((failure) {
      emit(ProductsFailureState(failure.error));
    }, (products) {
      this.products = products;
      emit(ProductsSuccessState(products));
    });
  }

  List<ProductModel> searchedProductsList = [];

  void getSearchedProductsList({required String productName}) {
    searchedProductsList = products.where((element) {
      return element.name.toLowerCase().contains(productName.toLowerCase());
    }).toList();
    emit(GetSearchedProductsList());
  }

  void startSearch(BuildContext context) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    isSearching = true;
    emit(ChangeIsSearchingState());
  }

  void stopSearch() {
    _clearSearch();
    isSearching = false;
    emit(ChangeIsSearchingState());
  }

  void _clearSearch() {
    searchController.clear();
    emit(ChangeIsSearchingState());
  }
}
