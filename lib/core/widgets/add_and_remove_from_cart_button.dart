import 'package:flutter/material.dart';
import 'package:shop/config/icons/icons_broken.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/widgets/custom_container_button.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';


class AddAndRemoveFromCartButton extends StatelessWidget {
  const AddAndRemoveFromCartButton({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return CustomContainerButton(
      onTap: () {
        // if (!GetCartCubit.get(context).cartId.contains(book.id)) {
        //   AddToCartCubit.get(context)
        //       .addToCart(bookId: book.id.toString(), context: context)
        //       .then((value) {
        //     GetCartCubit.get(context).cartId.add(book.id!);
        //     GetCartCubit.get(context).getCart();
        //   });
        // }
      },
      icon: IconBroken.Buy,
      color: AppColors.grey,
      // color: GetCartCubit.get(context).cartId.contains(product.id)
      //     ? AppColors.indigo
      //     : AppColors.grey,
    );
  }
}


// @override
// Widget build(BuildContext context) {
//   return BlocConsumer<GetCartCubit, GetCartState>(
//     listener: (context, state) {},
//     builder: (context, state) {
//       return CustomContainerButton(
//         onTap: () {
//           // if (!GetCartCubit.get(context).cartId.contains(book.id)) {
//           //   AddToCartCubit.get(context)
//           //       .addToCart(bookId: book.id.toString(), context: context)
//           //       .then((value) {
//           //     GetCartCubit.get(context).cartId.add(book.id!);
//           //     GetCartCubit.get(context).getCart();
//           //   });
//           // }
//         },
//         icon: IconBroken.Buy,
//         color: AppColors.grey,
//         // color: GetCartCubit.get(context).cartId.contains(product.id)
//         //     ? AppColors.indigo
//         //     : AppColors.grey,
//       );
//     },
//   );
// }