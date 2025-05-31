
import 'package:flutter/gestures.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';

import '../components/close_button_background.dart';

class EnterAuthenticationCodeScreen extends StatefulWidget {
  const EnterAuthenticationCodeScreen({super.key});

  @override
  State<EnterAuthenticationCodeScreen> createState() =>
      _EnterAuthenticationCodeScreenState();
}

class _EnterAuthenticationCodeScreenState
    extends State<EnterAuthenticationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    var bodyMedium = context.textTheme.bodyMedium;
    var bodyMediumPrimary = bodyMedium?.copyWith(color: AppColors.primary);
    return BaseScaffold(
        backgroundColor: AppColors.coolBlack,

        child: SafeArea(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child:  SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppCloseButton(),
                  40.verticalSpace,
                  Text(
                    'Enter your authentication\ncode',
                    style: context.textTheme.headlineMedium?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                  20.verticalSpace,
                  Text(
                    "We've sent a verification code to your registered device. Enter the 6-digit code below to complete sign-in.",
                    style: bodyMedium?.copyWith(color: AppColors.white),
                  ),
                  40.verticalSpace,
                  Text(
                    "Enter verification code",
                    style: bodyMedium?.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                  15.verticalSpace,
                  // OtpInputField(
                  //   length: 6,
                  //   onChange: (value) {},
                  // ),
                  10.verticalSpace,
                  Text.rich(
                    TextSpan(
                        children: [TextSpan(text: '', style: bodyMediumPrimary)],
                        text: 'Code expires in\t',
                        style: bodyMedium?.copyWith(color: AppColors.white)),
                  ),
                ],
              ),
            )),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(TextSpan(
                      text: "Didn't receive the code?\t",
                      style: bodyMedium?.copyWith(color: AppColors.textGray1),
                      children: [
                        TextSpan(
                            text: 'Resend',
                            style: bodyMediumPrimary,
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ])),
                ),
                20.verticalSpace,
                PrimaryButton.primary(
                  onPressed: () {},
                  text: 'Verify & Continue',
                ),
                10.verticalSpace,
                PrimaryButton.light(
                  text: 'Use backup code instead',
                ),
                20.verticalSpace,
                Text(
                  "This additional security step helps protect your account and trading data from unauthorized access.",
                  textAlign: TextAlign.center,
                  style:
                  bodyMedium?.copyWith(color: AppColors.white, fontSize: 14),
                ),
                20.verticalSpace,
              ],
            )
          ],
        )));
  }
}
