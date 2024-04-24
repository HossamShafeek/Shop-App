import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/config/icons/icons_broken.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/widgets/custom_container_button.dart';
import 'package:shop/feature/favourites/presentation/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:shop/feature/favourites/presentation/cubits/favourites_cubit/favourites_state.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

class AddAndRemoveFromFavouritesButton extends StatelessWidget {
  const AddAndRemoveFromFavouritesButton({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        return CustomContainerButton(
          onTap: () {
            FavouritesCubit.get(context).checkExistingProductAndAddOrRemove(
              product: product,
              context: context,
            );
          },
          icon: IconBroken.Heart,
          color: FavouritesCubit.get(context).favourites.contains(product)
              ? AppColors.redAccent
              : AppColors.grey,
        );
      },
    );
  }
}
