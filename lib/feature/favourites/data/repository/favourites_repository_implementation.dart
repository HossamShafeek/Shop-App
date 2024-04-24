import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/feature/favourites/data/repository/favourites_repository.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

class FavouritesRepositoryImplementation extends FavouritesRepository {
  FavouritesRepositoryImplementation();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<ServerFailure, List<ProductModel>>> getFavourites(
      {required String userId}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> result = await firebaseFirestore
          .collection('users')
          .doc(userId)
          .collection('favourites')
          .get();
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
  Future<Either<ServerFailure, String>> addToFavourites({
    required String userId,
    required ProductModel product,
  }) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(userId)
          .collection('favourites')
          .doc(product.id)
          .set(product.toJson());
      return const Right('Product Added To Favourites');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> removeToFavourites({
    required String productId,
    required String userId,
  }) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(userId)
          .collection('favourites')
          .doc(productId)
          .delete();
      return const Right('Product Removed From Favourites');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
