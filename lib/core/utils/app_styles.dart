import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';

abstract class AppStyles {
  static final styleRegular13Grey = TextStyle(
    fontSize: 11.sp,
    color: AppColors.grey,
  );
  static final styleRegular14Grey = TextStyle(
    fontSize: 12.sp,
    color: AppColors.grey,
  );
  static final styleRegular15Grey = TextStyle(
    fontSize: 13.sp,
    color: AppColors.grey,
  );
  static final styleRegular16Black = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static final styleRegular18White =
      TextStyle(fontSize: 16.sp, color: AppColors.white);
  static final styleBold16Black = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static final styleBold18Black = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );
  static final styleBold20Black = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );
  static final styleRegular25Black = TextStyle(
    fontSize: 23.sp,
    color: AppColors.primary,
  );
  static final styleBold30Black = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
  );
  static final styleBold40Green = TextStyle(
    fontSize: 38.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
}
