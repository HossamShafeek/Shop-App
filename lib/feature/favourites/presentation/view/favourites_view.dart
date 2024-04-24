import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/widgets/custom_empty_widget.dart';
import 'package:shop/feature/favourites/presentation/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:shop/feature/favourites/presentation/cubits/favourites_cubit/favourites_state.dart';
import 'package:shop/feature/home/presentation/views/widgets/products_list_view_item.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        FavouritesCubit cubit = FavouritesCubit.get(context);
        if (FavouritesCubit.get(context).favourites.isNotEmpty) {
          return ListView.separated(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductsListViewItem(product: cubit.favourites[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppConstants.padding10h,
              );
            },
            itemCount: cubit.favourites.length,
          );
        } else {
          return CustomEmptyWidget(
            imagePath: AppAssets.noDataImage,
            message: AppStrings.favouritesAreEmpty,
          );
        }
      },
    );
  }
}
