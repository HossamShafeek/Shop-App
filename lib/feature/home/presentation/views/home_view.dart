import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/feature/home/presentation/views/widgets/banners_list_view.dart';
import 'package:shop/feature/home/presentation/views/widgets/gategories_horizontal_list_view.dart';
import 'package:shop/feature/home/presentation/views/widgets/most_popular_grid_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      physics: const BouncingScrollPhysics(),
      child:const  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BannersListView(),
          CategoriesHorizontalListView(),
          MostPopularGridView()
        ],
      ),
    );
  }
}