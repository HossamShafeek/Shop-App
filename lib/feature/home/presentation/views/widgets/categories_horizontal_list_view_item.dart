import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/feature/home/data/models/categories_model/categories_model.dart';

class CategoriesHorizontalListViewItem extends StatelessWidget {
  const CategoriesHorizontalListViewItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productsView,
            arguments: category.name);
      },
      child: Container(
        height: AppConstants.padding50h,
        padding: EdgeInsets.all(AppConstants.padding8h),
        decoration: BoxDecoration(
          color: AppColors.grey50,
          borderRadius: BorderRadius.circular(AppConstants.radius10r),
        ),
        child: Row(
          children: [
            Container(
              height: AppConstants.padding40h,
              width: AppConstants.padding40h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppConstants.radius8r),
              ),
              child: CustomNetworkImage(
                image: category.imageUrl,
              ),
            ),
            Gap(AppConstants.padding8h),
            Text(
              category.name,
              style: AppStyles.styleRegular16Black,
            ),
          ],
        ),
      ),
    );
  }
}
