import 'dart:async';
import 'package:country_picker/country_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/core/functions/show_snack_bar.dart';
import 'package:shop/feature/authentication/data/repository/authentication_repository.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.authenticationRepository)
      : super(AuthenticationInitialState());

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final AuthenticationRepository authenticationRepository;

  TextEditingController phoneController = TextEditingController();
  TextEditingController verificationController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  bool sendCodeToPhoneFromVerification = false;

  var formKeyForLogin = GlobalKey<FormState>();
  var formKeyForVerification = GlobalKey<FormState>();
  var formKeyForUserInformation = GlobalKey<FormState>();

  static AuthenticationCubit get(context) => BlocProvider.of(context);

  Country selectedCountry = Country(
    phoneCode: '20',
    countryCode: 'EG',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Egypt',
    example: 'Egypt',
    displayName: 'Egypt',
    displayNameNoCountryCode: 'EG',
    e164Key: '20-EG-0',
  );

  void changeSelectedCountry({required Country country}) {
    selectedCountry = country;
    emit(ChangeSelectedCountryState());
  }

  Future<void> sendCodeToPhone({required BuildContext context}) async {
    emit(SendCodeLoadingState());
    try {
      await firebaseAuth
          .verifyPhoneNumber(
            phoneNumber:
                '+${selectedCountry.phoneCode}${phoneController.text.trim()}',
            verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
            verificationFailed: (FirebaseAuthException error) {
              showErrorSnackBar(
                  context: context, message: error.message.toString());
              emit(SendCodeFailureState(error.message.toString()));
            },
            codeSent: (verificationId, forceResendingToken) {
              if (!sendCodeToPhoneFromVerification) {
                Navigator.pushNamed(context, Routes.verificationView,
                    arguments: VerificationViewParams(
                      verificationId: verificationId,
                      phone:
                          '+${selectedCountry.phoneCode}${phoneController.text.trim()}',
                    ));
                emit(SendCodeSuccessState());
              } else {
                emit(SendCodeSuccessState());
              }
            },
        timeout: const Duration(seconds: 30),
            codeAutoRetrievalTimeout: (verificationId) {
              //emit();
            },
          )
          .then((value) {});
    } on FirebaseException catch (error) {
      emit(SendCodeFailureState(error.message.toString()));
    } catch (error) {
      emit(SendCodeFailureState(error.toString()));
    }
  }

  late User user;

  void loginWithPhone({required String verificationId}) async {
    emit(LoginLoadingState());
    Either<Failure, User> result =
        await authenticationRepository.loginWithPhone(
      verificationId: verificationId,
      firebaseAuth: firebaseAuth,
      smsCode: verificationController.text,
    );
    result.fold((failure) {
      emit(LoginFailureState(failure.error));
    }, (user) {
      this.user  = user;
      emit(LoginSuccessState(user));
    });
  }

  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await firebaseFirestore.collection('users').doc(user.uid).get();
    if (snapshot.exists) {
      return true;
    } else {
      return false;
    }
  }
  int resendTimeForLoginView = 35;
  bool sendCodeForFirstTime =true;

  late Timer timerForLoginView;

  void changeResendTimeForLoginView() {
    timerForLoginView = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (resendTimeForLoginView != 0) {
          resendTimeForLoginView--;
          emit(ChangeResendTimeForLoginState());
        } else if(resendTimeForLoginView==0){
          timer.cancel();
        }
      },
    );
  }

  int resendTimeForVerification = 30;

  late Timer timerForVerification;

  void changeResendTime() {
    timerForVerification = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (resendTimeForVerification != 0) {
          resendTimeForVerification--;
          emit(ChangeResendTimeState());
        } else if(resendTimeForVerification==0){
          timer.cancel();
        }
      },
    );
  }

  void saveUserDataToFirebase()async{
    emit(SaveUserDataLoadingState());
    try{
      await firebaseFirestore.collection('users').doc(user.uid).set({
        'uid':user.uid,
        'phone':user.phoneNumber,
        'create_at':Timestamp.now(),
        'first_name':firstNameController.text,
        'last_name':lastNameController.text,
      });
      emit(SaveUserDataSuccessState());
    }on FirebaseException catch(error){
      emit(SaveUserDataFailureState(error.message.toString()));
    }
  }

}