import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/widgets/custom_back_button.dart';
import 'package:shop/feature/cart/presentation/views/widgets/cart_check_out_section.dart';
import 'package:shop/feature/cart/presentation/views/widgets/cart_view_body.dart';


class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.cart),
      ),
      body: const CartViewBody(),
      bottomNavigationBar: const CartCheckOutSection(),
    );
  }
}
