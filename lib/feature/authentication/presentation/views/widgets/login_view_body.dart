import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop/core/functions/show_snack_bar.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/core/widgets/gradient_button.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_state.dart';
import 'package:shop/feature/authentication/presentation/views/widgets/login_texts_fields_section.dart';
import 'package:shop/feature/authentication/presentation/views/widgets/title_and_subtitle.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SendCodeLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleAndSubtitle(
                    subtitle: AppStrings.signInSubtitle,
                    title: AppStrings.signIn,
                  ),
                  const LoginTextsFieldsSection(),
                  GradientButton(
                    onPressed: () {
                      AuthenticationCubit.get(context)
                          .sendCodeToPhoneFromVerification = false;
                      if (AuthenticationCubit.get(context)
                          .formKeyForLogin
                          .currentState!
                          .validate()) {
                        if (AuthenticationCubit.get(context)
                            .sendCodeForFirstTime) {
                          AuthenticationCubit.get(context)
                              .sendCodeForFirstTime = false;
                          AuthenticationCubit.get(context)
                              .sendCodeToPhone(context: context);
                          AuthenticationCubit.get(context).changeResendTimeForLoginView();
                        } else {
                          if (AuthenticationCubit.get(context)
                                  .resendTimeForLoginView ==
                              0) {
                            AuthenticationCubit.get(context)
                                .sendCodeToPhone(context: context);
                          } else {
                            showErrorSnackBar(
                              context: context,
                              message:
                                  'Please Try After ${AuthenticationCubit.get(context).resendTimeForLoginView} Second',
                            );
                          }
                        }
                      }
                    },
                    title: Text(
                      AppStrings.signIn,
                      style: AppStyles.styleRegular18White,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
