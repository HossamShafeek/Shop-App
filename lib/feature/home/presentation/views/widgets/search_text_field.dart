import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_styles.dart';


class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      cursorColor: AppColors.primary,
      //textInputAction: TextInputAction.search,
      onChanged: onChange,
      style: AppStyles.styleRegular18White.copyWith(
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: AppStyles.styleRegular16Black,
      ),
    );
  }
}
