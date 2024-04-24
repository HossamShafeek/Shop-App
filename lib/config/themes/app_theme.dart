import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_styles.dart';


ThemeData appTheme() {
  return ThemeData(
      primarySwatch: Colors.green,
      useMaterial3: false,
      unselectedWidgetColor: AppColors.grey,
      textTheme: GoogleFonts.montserratTextTheme(),
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        color: AppColors.white,
        elevation: 0,
        systemOverlayStyle: AppConstants.systemUiOverlayStyleDark,
        titleTextStyle: AppStyles.styleRegular25Black,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedIconTheme: IconThemeData(size: AppConstants.iconSize22),
        unselectedIconTheme: IconThemeData(size: AppConstants.iconSize22),
        selectedLabelStyle: AppStyles.styleRegular15Grey,
        unselectedLabelStyle: AppStyles.styleRegular13Grey,
      ));
}
