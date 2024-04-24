import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/widgets/custom_error_widget.dart';
import 'package:shop/core/widgets/loading_indicator_widget.dart';
import 'package:shop/feature/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/products_cubit/products_state.dart';
import 'package:shop/feature/home/presentation/views/widgets/products_list_view_item.dart';


class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      if (state is ProductsSuccessState ||
          state is GetSearchedProductsList ||
          state is ChangeIsSearchingState) {
        return ListView.separated(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          itemCount: ProductsCubit.get(context).searchController.text.isEmpty
              ? ProductsCubit.get(context).products.length
              : ProductsCubit.get(context).searchedProductsList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => ProductsListViewItem(
            product: ProductsCubit.get(context).searchController.text.isEmpty
                ? ProductsCubit.get(context).products[index]
                : ProductsCubit.get(context).searchedProductsList[index],
          ),
          separatorBuilder: (context, index) =>
              SizedBox(height: AppConstants.padding10h),
        );
      } else if (state is ProductsFailureState) {
        return CustomErrorWidget(error: state.error);
      } else {
        return const LoadingIndicatorWidget();
      }
    });
  }
}
