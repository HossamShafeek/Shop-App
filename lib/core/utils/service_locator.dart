import 'package:get_it/get_it.dart';
import 'package:shop/feature/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:shop/feature/cart/data/repository/cart_repository_implementation.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/feature/favourites/data/repository/favourites_repository_implementation.dart';
import 'package:shop/feature/favourites/presentation/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:shop/feature/home/data/repository/home_repository_implementation.dart';
import 'package:shop/feature/home/presentation/cubits/banners_cubit/banners_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/most_popular_cubit/most_popular_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/slider_details_cubit/slider_details_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //Auth Repo ( Auth Cubit )
  getIt.registerSingleton<AuthenticationRepositoryImplementation>(
      AuthenticationRepositoryImplementation());
  getIt.registerFactory(() =>
      AuthenticationCubit(getIt.get<AuthenticationRepositoryImplementation>()));
  //Bottom Nav Bar Cubit
  getIt.registerFactory(() => BottomNavigationCubit());
  //Home Repo ( Banners Cubit - Categories Cubit - Most Popular Cubit )
  getIt.registerSingleton<HomeRepositoryImplementation>(
      HomeRepositoryImplementation());
  getIt.registerFactory(
      () => BannersCubit(getIt.get<HomeRepositoryImplementation>()));
  getIt.registerFactory(
      () => CategoriesCubit(getIt.get<HomeRepositoryImplementation>()));
  getIt.registerFactory(
      () => MostPopularCubit(getIt.get<HomeRepositoryImplementation>()));
  //Slider Details Cubit
  getIt.registerFactory(() => SliderDetailsCubit());
  //Products Cubit
  getIt.registerFactory(
      () => ProductsCubit(getIt.get<HomeRepositoryImplementation>()));
  //Favourites Repo ( Favourites Cubit )
  getIt.registerSingleton(FavouritesRepositoryImplementation());
  getIt.registerFactory(
          () => FavouritesCubit(getIt.get<FavouritesRepositoryImplementation>()));
  //Cart Repo ( Cart Cubit )
  getIt.registerSingleton(CartRepositoryImplementation());
  getIt.registerFactory(
          () => CartCubit(getIt.get<CartRepositoryImplementation>()));
}