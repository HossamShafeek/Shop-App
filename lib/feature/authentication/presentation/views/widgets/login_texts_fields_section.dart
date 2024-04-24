import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/config/icons/icons_broken.dart';
import 'package:shop/core/utils/app_constants.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/widgets/custom_text_field.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_state.dart';
import 'package:shop/feature/authentication/presentation/views/widgets/select_country_widget.dart';

class LoginTextsFieldsSection extends StatelessWidget {
  const LoginTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return Form(
          key: AuthenticationCubit.get(context).formKeyForLogin,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.phone,
                controller: AuthenticationCubit.get(context).phoneController,
                suffixIcon:
                    Icon(IconBroken.Call, size: AppConstants.iconSize18),
                prefixIcon: SelectCountryWidget(
                  onSelect: (Country country) {
                    AuthenticationCubit.get(context)
                        .changeSelectedCountry(country: country);
                  },
                  country: AuthenticationCubit.get(context).selectedCountry,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone';
                  }
                  return null;
                },
                title: AppStrings.phone,
                hintText: AppStrings.enterYourPhone,
              ),
            ],
          ),
        );
      },
    );
  }
}
