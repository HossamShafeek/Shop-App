import 'package:dartz/dartz.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/feature/home/data/models/banner_model/banner_model.dart';
import 'package:shop/feature/home/data/models/categories_model/categories_model.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BannerModel>>> getBanners();
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<ProductModel>>> getMostPopular();
  Future<Either<Failure, List<ProductModel>>> getProducts({required String categoryName});
}
