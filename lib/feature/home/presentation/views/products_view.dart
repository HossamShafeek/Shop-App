import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/config/icons/icons_broken.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/widgets/custom_back_button.dart';
import 'package:shop/feature/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/products_cubit/products_state.dart';
import 'package:shop/feature/home/presentation/views/widgets/products_view_body.dart';
import 'package:shop/feature/home/presentation/views/widgets/search_text_field.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key, required this.categoryName}) : super(key: key);

  final String categoryName;

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    ProductsCubit.get(context).getProducts(categoryName: widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: ProductsCubit.get(context).isSearching
                ? SearchTextField(
                    controller: ProductsCubit.get(context).searchController,
                    onChange: (value) {
                      if (!value.startsWith(' ')) {
                        ProductsCubit.get(context).getSearchedProductsList(
                          productName: value,
                        );
                      }
                    },
                  )
                : const Text(AppStrings.products),
            actions: [
              ProductsCubit.get(context).isSearching
                  ? IconButton(
                      onPressed: () {
                        ProductsCubit.get(context).stopSearch();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: AppColors.primary,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        ProductsCubit.get(context).startSearch(context);
                      },
                      icon: const Icon(
                        IconBroken.Search,
                        color: AppColors.primary,
                      ),
                    ),
            ],
          ),
          body: const ProductsViewBody(),
        );
      },
    );
  }
}