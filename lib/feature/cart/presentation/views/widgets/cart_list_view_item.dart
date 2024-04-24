import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/icons/icons_broken.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/core/widgets/custom_container_button.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/feature/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/feature/cart/presentation/views/widgets/change_quantity_for_product.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            flex: 2,
            child: CustomNetworkImage(
              borderRadius: AppConstants.radius8r,
              image: product.images[0],
            ),
          ),
          Expanded(
            flex: 7,
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
                      CustomContainerButton(
                        onTap: () {
                          CartCubit.get(context)
                              .checkExistingProductAndAddOrRemove(
                            product: product,
                            context: context,
                          );
                        },
                        icon: IconBroken.Delete,
                        color: AppColors.redAccent,
                      ),
                    ],
                  ),
                  Text(
                    product.categoryName,
                    style: AppStyles.styleRegular16Black.copyWith(
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
                      ChangeQuantityForProduct(product: product),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}