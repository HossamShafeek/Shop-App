import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/widgets/custom_error_widget.dart';
import 'package:shop/core/widgets/loading_indicator_widget.dart';
import 'package:shop/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/categories_cubit/categories_state.dart';
import 'package:shop/feature/home/presentation/views/widgets/categories_vertical_list_view_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          return ListView.separated(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CategoriesVerticalListViewItem(
                category: state.categories[index],
              );
            },
            separatorBuilder: (context, index) {
              return Gap(AppConstants.padding10h);
            },
            itemCount: state.categories.length,
          );
        } else if (state is CategoriesFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}
