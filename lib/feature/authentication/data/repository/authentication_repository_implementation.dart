import 'package:dartz/dartz.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/feature/authentication/data/repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  @override
  Future<Either<Failure, User>> loginWithPhone({
    required String verificationId,
    required FirebaseAuth firebaseAuth,
    required String smsCode,
  }) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    try {
      User? user = (await firebaseAuth.signInWithCredential(credential)).user;
      return Right(user!);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
