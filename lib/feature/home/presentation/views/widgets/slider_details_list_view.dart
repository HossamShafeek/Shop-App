import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/presentation/cubits/slider_details_cubit/slider_details_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/slider_details_cubit/slider_details_state.dart';

class SliderDetailsListView extends StatelessWidget {
  const SliderDetailsListView({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderDetailsCubit, SliderDetailsState>(
      builder: (context, state) {
        return CarouselSlider.builder(
          itemCount: product.images.length,
          itemBuilder: (context, index, n) {
            return CustomNetworkImage(
              borderRadius: 0,
              width: double.infinity,
              height: double.infinity,
              image: product.images[index],
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              SliderDetailsCubit.get(context).changeSliderIndex(index: index);
            },
            height: double.infinity,
            autoPlay: true,
            viewportFraction: 1,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
          ),
        );
      },
    );
  }
}
