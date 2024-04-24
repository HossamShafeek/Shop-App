import 'package:dartz/dartz.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

abstract class CartRepository {
  Future<Either<Failure, List<ProductModel>>> getCart({
    required String userId,
  });

  Future<Either<Failure, String>> addToCart({
    required ProductModel product,
    required String userId,
  });

  Future<Either<Failure, String>> updateCart({
    required ProductModel product,
    required int quantity,
    required String userId,
  });

  Future<Either<Failure, String>> removeFromCart({
    required String productId,
    required String userId,
  });
}
