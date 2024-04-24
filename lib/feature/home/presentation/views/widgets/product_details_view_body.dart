import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/presentation/views/widgets/slider_details_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/icons/icons_broken.dart';
import 'package:shop/core/utils/app_constants.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.1,
      child: Stack(
        children: [
          SliderDetailsListView(
            product: product,
          ),
          Padding(
            padding: EdgeInsets.only(left: AppConstants.padding15h, top: 33.h),
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.25),
              radius: AppConstants.radius20r,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: Colors.white,
                  size: AppConstants.iconSize23,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
