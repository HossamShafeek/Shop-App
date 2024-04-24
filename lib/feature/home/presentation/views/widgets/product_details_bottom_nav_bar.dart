import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/presentation/views/widgets/custom_indicator_widget.dart';
import 'package:shop/feature/home/presentation/views/widgets/product_details_bottom_nav_bar_add_to_cart.dart';

class ProductDetailBottomNavBar extends StatelessWidget {
  const ProductDetailBottomNavBar({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 9.0,
      elevation: 30.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.7,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: AppConstants.defaultPadding,
            right: AppConstants.defaultPadding,
            bottom: AppConstants.defaultPadding,
            top: AppConstants.defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomIndicatorWidget(product: product),
              Gap(AppConstants.padding10h),
              Text(
                product.name,
                style: AppStyles.styleBold20Black,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppConstants.padding8h,
                  bottom: AppConstants.padding5h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'About',
                      style: AppStyles.styleRegular18White
                          .copyWith(color: AppColors.blue),
                    ),
                    Text(
                      product.categoryName,
                      style: AppStyles.styleRegular18White
                          .copyWith(color:AppColors.primary),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    product.description,
                    style: AppStyles.styleRegular16Black.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
              ProductDetailBottomNavBarAddToCart(product: product),
            ],
          ),
        ),
      ),
    );
  }
}