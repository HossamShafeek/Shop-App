import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/config/icons/icons_broken.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/core/widgets/gradient_button.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_state.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

class ProductDetailBottomNavBarAddToCart extends StatelessWidget {
  const ProductDetailBottomNavBarAddToCart({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppConstants.defaultPadding),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '${product.price} EGP',
                style: AppStyles.styleRegular18White.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Text(
                'Price',
                style: AppStyles.styleRegular15Grey.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            width: AppConstants.padding10w,
          ),
          BlocBuilder<CartCubit,CartState>(builder: (context, state) {
            return Expanded(
              child: GradientButton(
                onPressed: () {
                  CartCubit.get(context).checkExistingProductAndAddOrRemove(
                    product: product,
                    context: context,
                  );
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      CartCubit.get(context).cart.contains(product)
                          ? AppStrings.inCart
                          : AppStrings.addToCart,
                      style: AppStyles.styleRegular18White,
                    ),
                    SizedBox(
                      width: AppConstants.padding5w,
                    ),
                    Icon(
                      IconBroken.Buy,
                      color: Colors.white,
                      size: AppConstants.iconSize22,
                    ),
                  ],
                ),
              ),
            );
          },),
        ],
      ),
    );
  }
}
