import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/config/icons/icons_broken.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/feature/favourites/presentation/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:shop/feature/favourites/presentation/cubits/favourites_cubit/favourites_state.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/presentation/views/widgets/product_details_bottom_nav_bar.dart';
import 'package:shop/feature/home/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: AppColors.black.withOpacity(0.4),
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primary,
        body: ProductDetailsViewBody(
          product: product,
        ),
        bottomNavigationBar: ProductDetailBottomNavBar(
          product: product,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: BlocBuilder<FavouritesCubit, FavouritesState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                FavouritesCubit.get(context).checkExistingProductAndAddOrRemove(
                  product: product,
                  context: context,
                );
              },
              backgroundColor: AppColors.white,
              child: Icon(
                IconBroken.Heart,
                color: FavouritesCubit.get(context).favourites.contains(product)
                    ? AppColors.redAccent
                    : AppColors.grey,
                size: AppConstants.iconSize22,
              ),
            );
          },
        ),
      ),
    );
  }
}

void check() {}
