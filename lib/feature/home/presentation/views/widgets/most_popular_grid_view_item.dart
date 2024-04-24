import 'package:flutter/material.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

class MostPopularGridViewItem extends StatelessWidget {
  const MostPopularGridViewItem({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetailsView, arguments: product);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey50,
          borderRadius: BorderRadius.circular(AppConstants.radius10r),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppConstants.padding8h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomNetworkImage(
                  image: product.images[0],
                ),
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: AppConstants.padding3h),
                child: Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleBold18Black,
                ),
              ),
              Text(
                product.categoryName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleRegular16Black.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: AppConstants.padding3h),
                child: Text(
                  '${product.price} EGP',
                  style: AppStyles.styleRegular15Grey.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}