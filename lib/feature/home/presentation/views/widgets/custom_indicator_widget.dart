import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/presentation/cubits/slider_details_cubit/slider_details_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/slider_details_cubit/slider_details_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndicatorWidget extends StatelessWidget {
  const CustomIndicatorWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BlocBuilder<SliderDetailsCubit,SliderDetailsState>(
        builder: (context, state) {
          return AnimatedSmoothIndicator(
            count: product.images.length,
            activeIndex: SliderDetailsCubit.get(context).currentIndex,
            effect: ExpandingDotsEffect(
              dotColor: AppColors.grey300,
              dotHeight: 10,
              dotWidth: 10,
              expansionFactor: 4,
              spacing: 5,
              activeDotColor: AppColors.primary,
            ),
          );
        },
      ),
    );
  }
}