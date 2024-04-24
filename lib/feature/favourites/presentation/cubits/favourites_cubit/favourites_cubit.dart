import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/core/functions/show_snack_bar.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/feature/favourites/data/repository/favourites_repository.dart';
import 'package:shop/feature/favourites/presentation/cubits/favourites_cubit/favourites_state.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this.favouritesRepository)
      : super(GetFavouritesInitialState());

  static FavouritesCubit get(BuildContext context) => BlocProvider.of(context);

  final FavouritesRepository favouritesRepository;

  List<ProductModel> favourites = [];

  Future<void> getFavourites({required String userId}) async {
    emit(GetFavouritesLoadingState());
    Either<Failure, List<ProductModel>> result;
    result = await favouritesRepository.getFavourites(userId: userId);
    result.fold((failure) {
      emit(GetFavouritesFailureState(failure.error));
    }, (favourites) {
      this.favourites = favourites;
      emit(GetFavouritesSuccessState(favourites));
    });
  }

  Future<void> addToFavourites({
    required ProductModel product,
    required String userId,
    required BuildContext context,
  }) async {
    emit(AddToFavouritesLoadingState());
    Either<Failure, String> result;
    result = await favouritesRepository.addToFavourites(
      product: product,
      userId: userId,
    );
    result.fold((failure) {
      showErrorSnackBar(context: context, message: failure.error);
      emit(AddToFavouritesFailureState(failure.error));
    }, (message) {
      showSuccessSnackBar(context: context, message: message);
      emit(AddToFavouritesSuccessState(message));
    });
  }

  Future<void> removeFromFavourites({
    required String productId,
    required String userId,
    required BuildContext context,
  }) async {
    emit(RemoveFromFavouritesLoadingState());
    Either<Failure, String> result =
        await favouritesRepository.removeToFavourites(
      productId: productId,
      userId: userId,
    );
    result.fold((failure) {
      showErrorSnackBar(context: context, message: failure.error);
      emit(RemoveFromFavouritesFailureState(failure.error));
    }, (message) {
      showSuccessSnackBar(context: context, message: message);
      emit(RemoveFromFavouritesSuccessState(message));
    });
  }

  void checkExistingProductAndAddOrRemove({
    required ProductModel product,
    required BuildContext context,
  }) {
    if (favourites.contains(product)) {
      removeFromFavourites(
        productId: product.id,
        userId: AppConstants.userId,
        context: context,
      ).then((value) {
        getFavourites(userId: AppConstants.userId);
      });
    } else {
      addToFavourites(
        product: product,
        userId: AppConstants.userId,
        context: context,
      ).then((value) {
        getFavourites(userId: AppConstants.userId);
      });
    }
  }
}
