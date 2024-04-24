import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/utils/app_strings.dart';
import 'package:shop/core/utils/app_styles.dart';
import 'package:shop/core/widgets/custom_text_button.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:shop/feature/authentication/presentation/cubits/authentication_cubit/authentication_state.dart';

class ResendCodeWidget extends StatefulWidget {
  const ResendCodeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ResendCodeWidget> createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  @override
  void initState() {
    AuthenticationCubit.get(context).changeResendTime();
    super.initState();
  }

  @override
  void deactivate() {
    AuthenticationCubit.get(context).timerForVerification.cancel();
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.didNotReceive,
              style: AppStyles.styleRegular14Grey,
            ),
            CustomTextButton(
              onPressed: () {
                if (AuthenticationCubit.get(context).resendTimeForVerification == 0) {
                  AuthenticationCubit.get(context)
                      .sendCodeToPhoneFromVerification = true;
                  AuthenticationCubit.get(context)
                      .sendCodeToPhone(context: context).then((value) {
                        AuthenticationCubit.get(context).resendTimeForVerification=30;
                        AuthenticationCubit.get(context).changeResendTime();
                  });
                }
              },
              title: AppStrings.resend,
            ),
            const Spacer(),
            Text(
              AuthenticationCubit.get(context).resendTimeForVerification.toString(),
              style: AppStyles.styleRegular14Grey,
            ),
          ],
        );
      },
    );
  }
}
