import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/feature/home/data/models/banner_model/banner_model.dart';
import 'package:shop/feature/home/data/models/categories_model/categories_model.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/data/repository/home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<BannerModel>>> getBanners() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('banners').get();
      List<BannerModel> banners = result.docs.map((banner) {
        return BannerModel.fromJson(banner.data());
      }).toList();
      return Right(banners);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('categories').get();
      List<CategoryModel> categories = result.docs.map((category) {
        return CategoryModel.fromJson(category.data());
      }).toList();
      return Right(categories);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getMostPopular() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('most popular').get();
      List<ProductModel> products = result.docs.map((product) {
        return ProductModel.fromJson(product.data());
      }).toList();
      return Right(products);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts(
      {required String categoryName}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
      await firebaseFirestore.collection(categoryName.toLowerCase()).get();
      List<ProductModel> products = result.docs.map((product) {
        //print(product.id);
        return ProductModel.fromJson(product.data());
      }).toList();
      return Right(products);
    }  on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
