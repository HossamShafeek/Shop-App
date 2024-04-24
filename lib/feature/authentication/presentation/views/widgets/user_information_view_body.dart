import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop/config/local/cache_helper.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/functions/show_snack_bar.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/core/widgets/gradient_button.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_state.dart';
import 'package:shop/feature/authentication/presentation/views/widgets/title_and_subtitle.dart';
import 'package:shop/feature/authentication/presentation/views/widgets/user_information_texts_fields_section.dart';

class UserInformationViewBody extends StatelessWidget {
  const UserInformationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SaveUserDataFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        } else if (state is SaveUserDataSuccessState) {
          CacheHelper.setString(key: 'userId', value: AuthenticationCubit.get(context).user.uid);
          AppConstants.userId=AuthenticationCubit.get(context).user.uid;
          Navigator.pushNamedAndRemoveUntil(context, Routes.layoutView, (route) => false);
          showSuccessSnackBar(
              context: context, message: 'Data Saved Successfully');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SaveUserDataLoadingState,
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
                    subtitle: AppStrings.userInformationSubtitle,
                    title: AppStrings.personalData,
                  ),
                  const UserInformationTextsFieldsSection(),
                  GradientButton(
                    onPressed: () {
                      if (AuthenticationCubit.get(context)
                          .formKeyForUserInformation
                          .currentState!
                          .validate()) {
                        AuthenticationCubit.get(context)
                            .saveUserDataToFirebase();
                      }
                    },
                    title: Text(
                      AppStrings.continueText,
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
