import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/config/icons/icons_broken.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/widgets/custom_text_field.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_state.dart';

class UserInformationTextsFieldsSection extends StatelessWidget {
  const UserInformationTextsFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return Form(
          key: AuthenticationCubit.get(context).formKeyForUserInformation,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.text,
                controller:
                AuthenticationCubit.get(context).firstNameController,
                prefixIcon:
                Icon(IconBroken.Profile, size: AppConstants.iconSize18),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                title: AppStrings.firstName,
                hintText: AppStrings.enterYourFirstName,
              ),
              CustomTextField(
                textInputType: TextInputType.text,
                controller: AuthenticationCubit.get(context).lastNameController,
                prefixIcon:
                Icon(IconBroken.Profile, size: AppConstants.iconSize18),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
                title: AppStrings.lastName,
                hintText: AppStrings.enterYourLastName,
              ),
            ],
          ),
        );
      },
    );
  }
}