import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/utils/service_locator.dart';
import 'package:shop/feature/authentication/presentation/views/login_view.dart';
import 'package:shop/feature/authentication/presentation/views/verification_view.dart';
import 'package:shop/feature/authentication/presentation/views/user_information_view.dart';
import 'package:shop/feature/cart/presentation/views/cart_view.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/presentation/cubits/banners_cubit/banners_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/most_popular_cubit/most_popular_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/slider_details_cubit/slider_details_cubit.dart';
import 'package:shop/feature/home/presentation/views/layout_view.dart';
import 'package:shop/feature/home/presentation/views/product_details_view.dart';
import 'package:shop/feature/home/presentation/views/products_view.dart';
import 'package:shop/feature/splash/presentation/views/splash_view.dart';

class VerificationViewParams {
  final String verificationId;
  final String phone;

  VerificationViewParams({required this.verificationId, required this.phone});
}

class Routes {
  static const String slashView = '/';
  static const String loginView = '/login_view';
  static const String verificationView = '/verification_view';
  static const String userInformationView = '/user_information_view';
  static const String layoutView = '/layout_view';
  static const String productDetailsView = '/product_details_view';
  static const String productsView = '/products_view';
  static const String cartView = '/cart_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.slashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case Routes.verificationView:
        final verificationViewParams =
            settings.arguments as VerificationViewParams;
        return MaterialPageRoute(
          builder: (context) => VerificationView(
            verificationViewParams: verificationViewParams,
          ),
        );
      case Routes.userInformationView:
        return MaterialPageRoute(
          builder: (context) => const UserInformationView(),
        );
      case Routes.layoutView:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt.get<BottomNavigationCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt.get<BannersCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt.get<CategoriesCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt.get<MostPopularCubit>(),
              ),
            ],
            child: const LayoutView(),
          ),
        );
      case Routes.productDetailsView:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt.get<SliderDetailsCubit>(),
            child: ProductDetailsView(
              product: product,
            ),
          ),
        );
      case Routes.productsView:
        final categoryName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt.get<ProductsCubit>(),
            child: ProductsView(
              categoryName: categoryName,
            ),
          ),
        );
      case Routes.cartView:
        return MaterialPageRoute(
          builder: (context) => const CartView(),
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
