import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/core/functions/show_snack_bar.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/feature/cart/data/repository/cart_repository.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_state.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepository) : super(GetCartInitialState());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  final CartRepository cartRepository;

  List<ProductModel> cart = [];

  Future<void> getCart({required String userId}) async {
    emit(GetCartLoadingState());
    Either<Failure, List<ProductModel>> result;
    result = await cartRepository.getCart(userId: userId);
    result.fold((failure) {
      emit(GetCartFailureState(failure.error));
    }, (cart) {
      this.cart = cart;
      emit(GetCartSuccessState(cart));
    });
  }

  Future<void> addToCart({
    required ProductModel product,
    required String userId,
    required BuildContext context,
  }) async {
    emit(AddToCartLoadingState());
    Either<Failure, String> result;
    result = await cartRepository.addToCart(
      product: product,
      userId: userId,
    );
    result.fold((failure) {
      showErrorSnackBar(context: context, message: failure.error);
      emit(AddToCartFailureState(failure.error));
    }, (message) {
      showSuccessSnackBar(context: context, message: message);
      emit(AddToCartSuccessState(message));
    });
  }

  Future<void> removeFromCart({
    required String productId,
    required String userId,
    required BuildContext context,
  }) async {
    emit(RemoveFromCartLoadingState());
    Either<Failure, String> result = await cartRepository.removeFromCart(
      productId: productId,
      userId: userId,
    );
    result.fold((failure) {
      showErrorSnackBar(context: context, message: failure.error);
      emit(RemoveFromCartFailureState(failure.error));
    }, (message) {
      showSuccessSnackBar(context: context, message: message);
      emit(RemoveFromCartSuccessState(message));
    });
  }

  Future<void> updateCart(
      {required ProductModel product, required, required int quantity}) async {
    emit(UpdateCartLoadingState());

    Either<Failure, String> result = await cartRepository.updateCart(
      product: product,
      quantity: quantity,
      userId: AppConstants.userId,
    );
    getCart(userId: AppConstants.userId);
    result.fold((failure) {
      emit(UpdateCartFailureState(failure.error));
    }, (message) {
      emit(UpdateCartSuccessState(message));
    });
  }

  void checkExistingProductAndAddOrRemove({
    required ProductModel product,
    required BuildContext context,
  }) {
    if (cart.contains(product)) {
      removeFromCart(
        productId: product.id,
        userId: AppConstants.userId,
        context: context,
      ).then((value) {
        getCart(userId: AppConstants.userId);
      });
    } else {
      addToCart(
        product: product,
        userId: AppConstants.userId,
        context: context,
      ).then((value) {
        getCart(userId: AppConstants.userId);
      });
    }
  }

  num getTotalPrice() {
    num totalPrice = 0;
    for (var product in cart) {
      num totalPriceForOneProduct = product.price*product.quantity;
      totalPrice += totalPriceForOneProduct;
    }
    return totalPrice;
  }
}
