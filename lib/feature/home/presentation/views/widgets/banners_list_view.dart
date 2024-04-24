import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/widgets/custom_error_widget.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/core/widgets/loading_indicator_widget.dart';
import 'package:shop/feature/home/presentation/cubits/banners_cubit/banners_cubit.dart';
import 'package:shop/feature/home/presentation/cubits/banners_cubit/banners_state.dart';


class BannersListView extends StatelessWidget {
  const BannersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannersCubit, BannersState>(
      builder: (context, state) {
        if (state is BannersSuccessState) {
          return CarouselSlider.builder(
            itemCount: state.banners.length,
            itemBuilder: (context, index, s) => InkWell(
              onTap: () {},
              child: CustomNetworkImage(
                image: state.banners[index].imageUrl,
                backgroundColor: AppColors.grey50,
              ),
            ),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.2,
              viewportFraction: 0.80,
              autoPlayInterval: const Duration(seconds: 4),
              enlargeCenterPage: true,
            ),
          );
        } else if (state is BannersFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}
