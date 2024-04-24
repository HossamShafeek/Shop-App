import 'package:flutter/material.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/feature/authentication/presentation/views/widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({
    super.key, required this.verificationViewParams,
  });

  final VerificationViewParams verificationViewParams;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: VerificationViewBody(
        verificationViewParams: verificationViewParams,),
    );
  }
}