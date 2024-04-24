import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/feature/cart/data/repository/cart_repository.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';

class CartRepositoryImplementation extends CartRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  CartRepositoryImplementation();

  @override
  Future<Either<Failure, List<ProductModel>>> getCart({
    required String userId,
  }) async{
    try {
      QuerySnapshot<Map<String, dynamic>> result = await firebaseFirestore
          .collection('users')
          .doc(userId)
          .collection('cart')
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
  Future<Either<Failure, String>> addToCart({
    required ProductModel product,
    required String userId,
  }) async{
    try {
      await firebaseFirestore
          .collection('users')
          .doc(userId)
          .collection('cart').doc(product.id)
          .set(product.toJson());
      return const Right('Product Added To Cart');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeFromCart({
    required String productId,
    required String userId,
  })async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(productId)
          .delete();
      return const Right('Product Removed From Cart');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateCart({
    required ProductModel product,
    required int quantity,
    required String userId,
  }) async{
    try {
      await firebaseFirestore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(product.id).update({
        'quantity':quantity,
      }).then((value) {
        getCart(userId: userId);
      });
      return const Right('Product Removed From Cart');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
