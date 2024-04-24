import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppStyles.styleRegular14Grey.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
