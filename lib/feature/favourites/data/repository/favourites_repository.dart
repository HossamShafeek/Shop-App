import 'package:dartz/dartz.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

abstract class FavouritesRepository {
  Future<Either<ServerFailure, List<ProductModel>>> getFavourites({
    required String userId,
  });

  Future<Either<ServerFailure, String>> addToFavourites({
    required String userId,
    required ProductModel product,
  });

  Future<Either<ServerFailure, String>> removeToFavourites({
    required String productId,
    required String userId,
  });
}
