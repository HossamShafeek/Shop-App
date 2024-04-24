import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/feature/favourites/presentation/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/banners_cubit/banners_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:shop/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/most_popular_cubit/most_popular_cubit.dart';
import 'package:shop/feature/home/presentation/views/widgets/cart_button_widget.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  void initState() {
    BannersCubit.get(context).getBanners();
    CategoriesCubit.get(context).getCategories();
    MostPopularCubit.get(context).getMostPopular();
    FavouritesCubit.get(context).getFavourites(userId: AppConstants.userId);
    CartCubit.get(context).getCart(userId: AppConstants.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(AppStrings.shop),
            actions: const [
              CartButtonWidget(),
            ],
          ),
          body: BottomNavigationCubit.get(context)
              .bodyScreens[BottomNavigationCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              BottomNavigationCubit.get(context).changeBottomNavigation(index);
            },
            currentIndex: BottomNavigationCubit.get(context).currentIndex,
            items: BottomNavigationCubit.get(context).bottomNavigationBarItems,
          ),
        );
      },
    );
  }
}