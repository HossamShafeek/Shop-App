import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/widgets/custom_error_widget.dart';
import 'package:shop/core/widgets/loading_indicator_widget.dart';
import 'package:shop/core/widgets/title_list_and_view_all.dart';
import 'package:shop/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/categories_cubit/categories_state.dart';
import 'package:shop/feature/home/presentation/views/widgets/categories_horizontal_list_view_item.dart';

class CategoriesHorizontalListView extends StatelessWidget {
  const CategoriesHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit,CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          return Column(
            children: [
              TitleListAndViewAll(
                title: AppStrings.categories,
                onPressed: () {},
              ),
              SizedBox(
                height: 56.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoriesHorizontalListViewItem(
                      category: state.categories[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Gap(AppConstants.padding10w);
                  },
                  itemCount: state.categories.length,
                ),
              ),
            ],
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