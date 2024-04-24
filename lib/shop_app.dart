import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/config/themes/app_theme.dart';
import 'package:shop/core/utils/service_locator.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/feature/favourites/presentation/cubits/favourites_cubit/favourites_cubit.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return BlocProvider(
          create: (context) => getIt.get<AuthenticationCubit>(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt.get<FavouritesCubit>(),),
              BlocProvider(create: (context) => getIt.get<AuthenticationCubit>(),),
              BlocProvider(create: (context) => getIt.get<CartCubit>(),),
            ],
            child: MaterialApp(
              title: 'Shop',
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              onGenerateRoute: AppRoutes.generateRoute,
            ),
          ),
        );
      },
    );
  }
}
