import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/local/cache_helper.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/service_locator.dart';
import 'package:shop/shop_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  setupServiceLocator();
  await CacheHelper.init();
  AppConstants.userId = CacheHelper.getString(key: 'userId') ?? '';
  runApp(const ShopApp());
}