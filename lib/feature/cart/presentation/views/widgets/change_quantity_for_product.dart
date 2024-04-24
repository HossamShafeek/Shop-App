import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_state.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

class ChangeQuantityForProduct extends StatelessWidget {
  const ChangeQuantityForProduct({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                if (product.quantity != 1) {
                  CartCubit.get(context).updateCart(
                    product: product,
                    quantity: product.quantity-1,
                  );
                }
              },
              child: Icon(
                Icons.remove,
                size: AppConstants.iconSize24,
                color: AppColors.redAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding10w,
              ),
              child: Text(
                product.quantity.toString(),
                style: AppStyles.styleRegular16Black.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                CartCubit.get(context).updateCart(
                  product: product,
                  quantity: product.quantity+1,
                );
              },
              child: Icon(
                Icons.add,
                size: AppConstants.iconSize24,
                color: AppColors.blue,
              ),
            ),
          ],
        );
      },
    );
  }
}
