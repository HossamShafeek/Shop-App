import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop/core/errors/failures.dart';


abstract class AuthenticationRepository {
  Future<Either<Failure, User>> loginWithPhone({
    required String verificationId,
    required FirebaseAuth firebaseAuth,
    required String smsCode,
  });
}
