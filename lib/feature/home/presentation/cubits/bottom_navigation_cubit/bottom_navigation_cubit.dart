import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop/config/icons/icons_broken.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/feature/favourites/presentation/view/favourites_view.dart';
import 'package:shop/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:shop/feature/home/presentation/views/categories_view.dart';
import 'package:shop/feature/home/presentation/views/home_view.dart';
import 'package:shop/feature/home/presentation/views/profile_view.dart';


class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitialState());

  static BottomNavigationCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavigation(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationState());
  }

  List<Widget> bodyScreens = const [
    HomeView(),
    CategoriesView(),
    FavouritesView(),
    ProfileView(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Home,
      ),
      label: AppStrings.home,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Category,
      ),
      label: AppStrings.categories,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Heart,
      ),
      label: AppStrings.favourites,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Profile,
      ),
      label: AppStrings.profile,
    ),
  ];
}
