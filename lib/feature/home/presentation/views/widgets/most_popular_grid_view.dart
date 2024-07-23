import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/widgets/title_list_and_view_all.dart';
import 'package:shop/feature/home/presentation/cubits/most_popular_cubit/most_popular_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/most_popular_cubit/most_popular_state.dart';
import 'package:shop/feature/home/presentation/views/widgets/most_popular_grid_view_item.dart';


class MostPopularGridView extends StatelessWidget {
  const MostPopularGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostPopularCubit, MostPopularState>(
      builder: (context, state) {
        if (state is MostPopularSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleListAndViewAll(
                title: AppStrings.mostPopular,
                onPressed: () {},
              ),
              StaggeredGridView.countBuilder(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: AppConstants.padding10w,
                  mainAxisSpacing: AppConstants.padding10w,
                  itemCount:
                  state.products.length >= 4 ? 4 : state.products.length,
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.count(1, index.isEven ? 1.4 : 1.2);
                  },
                  itemBuilder: (context, index) {
                    return MostPopularGridViewItem(
                      product: state.products[index],
                    );
                  }),
            ],
          );
        } else if (state is MostPopularFailureState) {
          return Center(
            child: Text(state.error, textAlign: TextAlign.center),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}