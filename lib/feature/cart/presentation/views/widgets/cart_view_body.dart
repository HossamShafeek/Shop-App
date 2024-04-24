import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/widgets/custom_empty_widget.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_state.dart';
import 'package:shop/feature/cart/presentation/views/widgets/cart_list_view_item.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';


class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        List<ProductModel>  products = CartCubit.get(context).cart;
        if (products.isNotEmpty) {
          return ListView.separated(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CartListViewItem(product: products[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppConstants.padding10h,
              );
            },
            itemCount: products.length,
          );
        } else {
          return CustomEmptyWidget(
            imagePath: AppAssets.cartImage,
            message: AppStrings.cartIsEmpty,
          );
        }
      },
    );
  }
}