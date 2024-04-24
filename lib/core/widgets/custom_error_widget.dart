import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;

  const CustomErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      error,
      style: AppStyles.styleRegular18White.copyWith(
        color: AppColors.black
      ),
    ));
  }
}
