import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/core/widgets/add_and_remove_from_favourites_button.dart';
import 'package:shop/core/widgets/add_and_remove_from_cart_button.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';


class ProductsListViewItem extends StatelessWidget {
  const ProductsListViewItem({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetailsView, arguments: product);
      },
      child: Container(
        padding: EdgeInsets.all(AppConstants.padding10h),
        width: double.infinity,
        height: 95.h,
        decoration: BoxDecoration(
          color: AppColors.grey50,
          borderRadius: BorderRadius.circular(AppConstants.radius10r),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: CustomNetworkImage(
                borderRadius: AppConstants.radius8r,
                image: product.images[0],
              ),
            ),
            Expanded(
              flex: 11,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppConstants.padding10w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppStyles.styleBold18Black,
                          ),
                        ),
                        AddAndRemoveFromCartButton(product: product),
                      ],
                    ),
                    Text(
                      product.categoryName,
                      style:
                          AppStyles.styleRegular16Black.copyWith(
                            color: AppColors.grey,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${product.price} EPG  ',
                          style: AppStyles.styleRegular15Grey.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        AddAndRemoveFromFavouritesButton(product: product),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
