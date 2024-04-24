import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pinput/pinput.dart';
import 'package:shop/config/local/cache_helper.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/functions/show_snack_bar.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/core/widgets/gradient_button.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_state.dart';
import 'package:shop/feature/authentication/presentation/views/widgets/resend_code_widget.dart';
import 'package:shop/feature/authentication/presentation/views/widgets/title_and_subtitle.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key, required this.verificationViewParams});

  final VerificationViewParams verificationViewParams;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        } else if (state is LoginSuccessState) {
          AuthenticationCubit.get(context)
              .checkExistingUser()
              .then((value) {
            if (value) {
              CacheHelper.setString(key: 'userId', value: state.user.uid);
              AppConstants.userId=state.user.uid;
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.layoutView, (route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.userInformationView, (route) => false);
            }
          });
          showSuccessSnackBar(
              context: context, message: 'Logged In Successfully');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall:
              state is LoginLoadingState || state is SendCodeLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Form(
                key: AuthenticationCubit.get(context).formKeyForVerification,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndSubtitle(
                      subtitle: AppStrings.verificationSubtitle +
                          verificationViewParams.phone,
                      title: AppStrings.verification,
                    ),
                    Pinput(
                      length: 6,
                      showCursor: true,
                      controller: AuthenticationCubit.get(context)
                          .verificationController,
                      validator: (value) {
                        if (value!.length != 6) {
                          return 'Please complete the OTP';
                        }
                        return null;
                      },
                    ),
                    Gap(AppConstants.padding25h),
                    GradientButton(
                      onPressed: () {
                        if (AuthenticationCubit.get(context)
                            .formKeyForVerification
                            .currentState!
                            .validate()) {
                          AuthenticationCubit.get(context).loginWithPhone(
                              verificationId:
                                  verificationViewParams.verificationId);
                        }
                      },
                      title: Text(
                        AppStrings.verify,
                        style: AppStyles.styleRegular18White,
                      ),
                    ),
                    const ResendCodeWidget(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}