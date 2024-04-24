import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/config/icons/icons_broken.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_state.dart';

class CartButtonWidget extends StatelessWidget {
  const CartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.cartView);
      },
      icon: Badge(
        backgroundColor: AppColors.redAccent,
        label: BlocBuilder<CartCubit,CartState>(
          builder: (context, state) {
            return Text(
              CartCubit.get(context).cart.length.toString(),
              style: AppStyles.styleRegular13Grey.copyWith(
                color: AppColors.white,
              ),
            );
          },
        ),
        child: Icon(
          IconBroken.Buy,
          color: AppColors.black,
          size: AppConstants.iconSize22,
        ),
      ),
    );
  }
}