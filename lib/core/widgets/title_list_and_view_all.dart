import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/core/widgets/custom_text_button.dart';

class TitleListAndViewAll extends StatelessWidget {
  const TitleListAndViewAll(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppConstants.padding8h,
        bottom: AppConstants.padding3h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.styleBold18Black,
          ),
          CustomTextButton(
            onPressed: onPressed,
            title: AppStrings.viewAll,
          ),
        ],
      ),
    );
  }
}