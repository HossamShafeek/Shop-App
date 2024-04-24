import 'package:flutter/material.dart';
import 'package:shop/feature/authentication/presentation/views/widgets/user_information_view_body.dart';


class UserInformationView extends StatelessWidget {
  const UserInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: UserInformationViewBody(),
    );
  }
}