import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/core/widgets/gradient_button.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_state.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';


class CartCheckOutSection extends StatelessWidget {
  const CartCheckOutSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        List<ProductModel>? products = CartCubit.get(context).cart;
        return SizedBox(
          height: 100.h,
          child: Padding(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price:',
                      style: AppStyles.styleRegular18White.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      products.isEmpty?'0.00 EGP':
                      '${CartCubit.get(context).getTotalPrice().toString()} EGP',
                      style: AppStyles.styleRegular18White.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstants.padding10h,
                ),
                GradientButton(
                  onPressed: () {
                    // if(products.data!.cartItems!.isNotEmpty){
                    //   Navigator.pushNamed(context, Routes.checkoutView);
                    // }
                  },
                  title: Text(
                    AppStrings.checkout,
                    style: AppStyles.styleRegular18White,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
